package com.org.utils;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.org.conf.model.OperationConf;

/**
 * 
 * TODO {Excel 读取帮助文件}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class ExcelReader {

	/**
	 * 07 版本之前
	 */
	public final static String FIXBFZS = "xsl";

	/**
	 * 07 版本之后
	 */
	public final static String FIXAFZS = "xlsx";

	private static HSSFWorkbook hssfWorkbook;

	private static XSSFWorkbook xssfWorkbook;

	/**
	 * 
	 * 获取文件后缀名
	 *
	 * @author mao.ru
	 * @param name
	 * @return
	 * @since JDK 1.7
	 */
	public static String getPostfix(String name) {
		if (name != null) {
			String[] str = name.split("\\.");
			if(str.length != 0){
				return str[str.length - 1];
			}
		}
		return null;

	}

	/**
	 * 
	 * 导入数据
	 * 
	 * @author mao.ru
	 * @param is
	 * @since JDK 1.7
	 */
	public static List<OperationConf> improt(MultipartFile mapkfile, Long userId) {
		List<OperationConf> list = new ArrayList<OperationConf>();
		try {
			String name = mapkfile.getOriginalFilename();
			String fix = getPostfix(name);
			if (FIXBFZS.equals(fix)) {
				hssfWorkbook = new HSSFWorkbook(mapkfile.getInputStream());
				for (int numSheet = 0; numSheet < hssfWorkbook
						.getNumberOfSheets(); numSheet++) {
					HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
					if (hssfSheet == null) {
						continue;
					}
					// Read the Row
					for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
						HSSFRow hssfRow = hssfSheet.getRow(rowNum);
						if (hssfRow != null) {
							OperationConf oc = new OperationConf();
							HSSFCell priceService = hssfRow.getCell(1);
							HSSFCell country = hssfRow.getCell(2);
							HSSFCell operator = hssfRow.getCell(3);
							HSSFCell shortCode = hssfRow.getCell(4);
							HSSFCell localPrice = hssfRow.getCell(5);
							HSSFCell mcc = hssfRow.getCell(6);
							HSSFCell mnc = hssfRow.getCell(7);
							HSSFCell keyword = hssfRow.getCell(8);
							oc.setPriceService(getStringCellValue(priceService));
							oc.setCountry(getStringCellValue(country));
							oc.setOperator(getStringCellValue(operator));
							oc.setShortCode(getStringCellValue(shortCode));
							oc.setLocalPrice(new BigDecimal(
									getStringCellValue(localPrice)));
							oc.setMcc(getStringCellValue(mcc));
							oc.setMnc(getStringCellValue(mnc));
							oc.setKeyword(getStringCellValue(keyword));
							oc.setCreateTime(new Date());
							oc.setCreateUser(userId);
							list.add(oc);
						}
					}
				}
			}
			if (FIXAFZS.equals(fix)) {
				xssfWorkbook = new XSSFWorkbook(mapkfile.getInputStream());
				// Read the Sheet
				for (int numSheet = 0; numSheet < xssfWorkbook
						.getNumberOfSheets(); numSheet++) {
					XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
					if (xssfSheet == null) {
						continue;
					}
					// Read the Row
					for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
						XSSFRow xssfRow = xssfSheet.getRow(rowNum);
						if (xssfRow != null) {
							OperationConf oc = new OperationConf();
							XSSFCell priceService = xssfRow.getCell(1);
							XSSFCell country = xssfRow.getCell(2);
							XSSFCell operator = xssfRow.getCell(3);
							XSSFCell shortCode = xssfRow.getCell(4);
							XSSFCell localPrice = xssfRow.getCell(5);
							XSSFCell mcc = xssfRow.getCell(6);
							XSSFCell mnc = xssfRow.getCell(7);
							XSSFCell keyword = xssfRow.getCell(8);
							oc.setPriceService(getValue(priceService));
							oc.setCountry(getValue(country));
							oc.setOperator(getValue(operator));
							oc.setShortCode(getValue(shortCode));
							oc.setLocalPrice(new BigDecimal(getValue(localPrice)));
							oc.setMcc(getValue(mcc));
							oc.setMnc(getValue(mnc));
							oc.setKeyword(getValue(keyword));
							oc.setCreateTime(new Date());
							oc.setCreateUser(userId);
							list.add(oc);
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static String getStringCellValue(HSSFCell cell) {
		String strCell = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			strCell = cell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			strCell = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			strCell = String.valueOf(cell.getBooleanCellValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			strCell = "";
			break;
		default:
			strCell = "";
			break;
		}
		return strCell;
	}

	protected static String getValue(XSSFCell hssfCell) {
		String strCell = "";
		switch (hssfCell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			strCell = hssfCell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			strCell = String.valueOf(hssfCell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			strCell = String.valueOf(hssfCell.getBooleanCellValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			strCell = "";
			break;
		default:
			strCell = "";
			break;
		}
		return strCell;
	}

}
