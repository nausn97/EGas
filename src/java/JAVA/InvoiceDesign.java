/**
 * DynamicReports - Free Java reporting library for creating reports dynamically
 *
 * Copyright (C) 2010 - 2014 Ricardo Mariaca
 * http://www.dynamicreports.org
 *
 * This file is part of DynamicReports.
 *
 * DynamicReports is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * DynamicReports is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with DynamicReports. If not, see <http://www.gnu.org/licenses/>.
 */

package JAVA;

import Bean_and_Action.Data;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.base.expression.AbstractSimpleExpression;
import static net.sf.dynamicreports.report.builder.DynamicReports.*;

import net.sf.dynamicreports.report.builder.column.TextColumnBuilder;
import net.sf.dynamicreports.report.builder.component.ComponentBuilder;
import net.sf.dynamicreports.report.builder.component.HorizontalListBuilder;
import net.sf.dynamicreports.report.builder.style.StyleBuilder;
import net.sf.dynamicreports.report.builder.subtotal.AggregationSubtotalBuilder;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import net.sf.dynamicreports.report.definition.ReportParameters;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;

/**
 * @author Ricardo Mariaca (r.mariaca@dynamicreports.org)
 */
public class InvoiceDesign {
	private InvoiceData data;
        private String disname;
	private AggregationSubtotalBuilder<BigDecimal> totalSum;

	public JasperReportBuilder build() throws DRException {
		JasperReportBuilder report = report();

		//init styles
		StyleBuilder columnStyle = stl.style(Templates.columnStyle)
			.setBorder(stl.pen1Point());
		StyleBuilder subtotalStyle = stl.style(columnStyle)
			.bold();
		StyleBuilder shippingStyle = stl.style(Templates.boldStyle)
			.setHorizontalAlignment(HorizontalAlignment.RIGHT);

		//init columns
		TextColumnBuilder<Integer> rowNumberColumn = col.reportRowNumberColumn()
			.setFixedColumns(2)
			.setHorizontalAlignment(HorizontalAlignment.CENTER);
		TextColumnBuilder<String> descriptionColumn = col.column("Description", "description", type.stringType())
			.setFixedWidth(250);
		TextColumnBuilder<Integer> quantityColumn = col.column("Quantity", "quantity", type.integerType())
			.setHorizontalAlignment(HorizontalAlignment.CENTER);
		TextColumnBuilder<BigDecimal> unitPriceColumn = col.column("Unit Price", "unitprice", Templates.currencyType);
		TextColumnBuilder<String> taxColumn = col.column("Tax", exp.text("0%"))
			.setFixedColumns(3);
		//price = unitPrice * quantity
		TextColumnBuilder<BigDecimal> priceColumn = unitPriceColumn.multiply(quantityColumn)
			.setTitle("Price")
			.setDataType(Templates.currencyType);
		//vat = price * tax
		TextColumnBuilder<BigDecimal> vatColumn = priceColumn.multiply(data.getInvoice().getTax())
			.setTitle("VAT")
			.setDataType(Templates.currencyType);
		//total = price + vat
		TextColumnBuilder<BigDecimal> totalColumn = priceColumn.add(vatColumn)
			.setTitle("Total Price")
			.setDataType(Templates.currencyType)
			.setRows(2)
			.setStyle(subtotalStyle);
		//init subtotals
		totalSum = sbt.sum(totalColumn)
			.setLabel("Total:")
			.setLabelStyle(Templates.boldStyle);

		//configure report
		report
			.setTemplate(Templates.reportTemplate)
			.setColumnStyle(columnStyle)
			.setSubtotalStyle(subtotalStyle)
			//columns
			.columns(
				rowNumberColumn, descriptionColumn, quantityColumn, unitPriceColumn, totalColumn, priceColumn, taxColumn, vatColumn)
			.columnGrid(
				rowNumberColumn, descriptionColumn, quantityColumn, unitPriceColumn,
				grid.horizontalColumnGridList()
					.add(totalColumn).newRow()
					.add(priceColumn, taxColumn, vatColumn))
			//subtotals
			.subtotalsAtSummary(
				totalSum, sbt.sum(priceColumn), sbt.sum(vatColumn))
			//band components
                        
			.title(
				Templates.createTitleComponent("CashMemo No.: " + data.getInvoice().getId()),
				cmp.horizontalList().setStyle(stl.style(10)).setGap(50).add(
					cmp.hListCell(createCustomerComponent("Bill To", data.getInvoice().getBillTo())).heightFixedOnTop()),
				cmp.verticalGap(10))
			.pageFooter(
				Templates.footerComponent)
			.summary(
				//cmp.text(data.getInvoice().getShipping()).setValueFormatter(Templates.createCurrencyValueFormatter("Shipping:")).setStyle(shippingStyle),
				cmp.horizontalList(
					cmp.text("Payment terms: 30 days").setStyle(Templates.bold12CenteredStyle),
					cmp.text(new TotalPaymentExpression()).setStyle(Templates.bold12CenteredStyle)),
                                
				cmp.verticalGap(30),
				cmp.text("Thank you for your business").setStyle(Templates.bold12CenteredStyle))
			.setDataSource(data.createDataSource());

		return report;
	}

	private ComponentBuilder<?, ?> createCustomerComponent(String label, Customer customer) {
		HorizontalListBuilder list = cmp.horizontalList().setBaseStyle(stl.style().setTopBorder(stl.pen1Point()).setLeftPadding(10));
		addCustomerAttribute(list, "Consumer Id", customer.getCID());
                addCustomerAttribute(list, "Name", customer.getName());
		addCustomerAttribute(list, "Address", customer.getAddress());
		addCustomerAttribute(list, "City", customer.getCity());
		addCustomerAttribute(list, "Email", customer.getEmail());
                addCustomerAttribute(list, "Distributor Name", disname);
                
		return cmp.verticalList(
							cmp.text(label).setStyle(Templates.boldStyle),
							list);
	}

	private void addCustomerAttribute(HorizontalListBuilder list, String label, String value) {
		if (value != null) {
			list.add(cmp.text(label + ":").setFixedColumns(8).setStyle(Templates.boldStyle), cmp.text(value)).newRow();
		}
	}

	private class TotalPaymentExpression extends AbstractSimpleExpression<String> {
		private static final long serialVersionUID = 1L;

		@Override
		public String evaluate(ReportParameters reportParameters) {
			BigDecimal total = reportParameters.getValue(totalSum);
			BigDecimal shipping = total.add(data.getInvoice().getShipping());
			return "Total payment: " + Templates.currencyType.valueToString(shipping, reportParameters.getLocale());
		}
	}
        public InvoiceDesign()
        {
            data=new InvoiceData();
            try {
			JasperReportBuilder report = build();
			report.print(true);
		} catch (DRException e) {
			e.printStackTrace();
		}
        }
        public InvoiceDesign(InvoiceData data)
        {
            this.data=data;
            try {
			JasperReportBuilder report = build();
			report.show(false);
                        
		} catch (DRException e) {
			e.printStackTrace();
		}
        }
        		JasperReportBuilder report; 
	
        public InvoiceDesign(InvoiceData data,String disname)
        {
            this.data=data;
            this.disname=disname;
            try {
			report = build();
			
                        
		} catch (DRException e) {
			e.printStackTrace();
		}
        }
        public JasperReportBuilder getReport()
        {
            return report;
        }
        public void showReport()
        {
            try {
                report.show(false);
            } catch (DRException ex) {
                Logger.getLogger(InvoiceDesign.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
	public static void generateCashmemo(String id,String cid) throws FileNotFoundException {
            String name="",address="",email="",city="";
                            try{
                                Connection con = Data.getConnection();
                                Statement st = con.createStatement();
                                String vQuery = "select fname,mname,lname,hname_flatno,housingcomplex_buildingno,street_roadname,city,email from [dbo].[user] as u inner join consumer as c on (u.userid = c.userid) where c.CID='"+cid+"'";
                                ResultSet rs = st.executeQuery(vQuery);
                                if(rs.next()){
                                    name = rs.getString("fname")+" "+rs.getString("mname")+" "+rs.getString("lname");
                                    address = rs.getString("hname_flatno")+" "+rs.getString("housingcomplex_buildingno")+" "+rs.getString("street_roadname");
                                    city = rs.getString("city");
                                    email = rs.getString("email");
                                    con.close();
                                }
                            }catch(Exception e)
                            {
                                
                            }
                            final Customer c=new Customer();
                            final Item it=new Item();
                            c.setCID(cid);
                            c.setName(name);
                            c.setAddress(address);
                            c.setCity(city);
                            c.setEmail(email);
                            it.setQuantity(2);
                            it.setUnitprice(new BigDecimal(550));
                            it.setDescription("Yeah");
                            
                            
                            
                            
    
		InvoiceDesign design = new InvoiceDesign(new InvoiceData(c,it,100),"LOVELY PROFESSIONAL");
                JasperReportBuilder report=design.getReport();
                design.showReport();
                try{
                File f=File.createTempFile("123456789.pdf", null);
                OutputStream targetFile=new FileOutputStream(f);                
                report.toPdf(targetFile);
                }catch(Exception e)
                {
                            
                }
	}
}