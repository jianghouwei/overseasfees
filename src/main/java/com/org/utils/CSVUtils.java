package com.org.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CSVUtils {

	private static Logger logger = Logger.getLogger(CSVUtils.class);

	/**
	 * 导出
	 * 
	 * @param filecsv文件
	 *            (路径+文件名)
	 * @param dataList
	 *            数据
	 * @return
	 */
	public static boolean exportCsv(File file, List<String> dataList) {
		boolean isSucess = false;
		logger.info("创建导出文件路径：--------[" + file.getParentFile() + "文件名称"
				+ file.getName() + "]");
		File parent = file.getParentFile();
		if (parent != null && !parent.exists()) {
			parent.mkdirs();
		}
		try {
			file.createNewFile();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		FileOutputStream out = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		try {
			out = new FileOutputStream(file);
			osw = new OutputStreamWriter(out, "GBK");
			bw = new BufferedWriter(osw);
			if (dataList != null && !dataList.isEmpty()) {
				for (String data : dataList) {
					bw.append(data).append("\r");
				}
			}
			isSucess = true;
		} catch (Exception e) {
			isSucess = false;
		} finally {
			if (bw != null) {
				try {
					bw.close();
					bw = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (osw != null) {
				try {
					osw.close();
					osw = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (out != null) {
				try {
					out.close();
					out = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		logger.info("导出文件结束：--------[===============导出结果：{"+isSucess+"}=============]");
		return isSucess;
	}

	/**
	 * 
	 * 生成导出数据
	 * 
	 * @author mao.ru
	 * @param list
	 *            导出数据
	 * @param headMap
	 *            标题中文
	 * @param head
	 *            导出字段顺序
	 * @return
	 * @since JDK 1.7
	 */
	public static List<String> getdataList(List<Map<String, Object>> list,
			Map<String, String> headMap, List<String> head) {
		List<String> listdata = new ArrayList<String>();
		StringBuilder sb_head = new StringBuilder();
		for (int i = 0; i < head.size(); i++) {
			String key = head.get(i);
			if (i == head.size() - 1) {
				sb_head.append(headMap.get(key));
			} else {
				sb_head.append(headMap.get(key)).append(",");
			}
		}
		listdata.add(sb_head.toString());
		for (Map<String, Object> map : list) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < head.size(); i++) {
				String key = head.get(i);
				if (i == head.size() - 1) {
					sb.append(map.get(key));
				} else {
					sb.append(map.get(key)).append(",");
				}
			}
			listdata.add(sb.toString());
		}
		return listdata;
	}

	/**
	 * 导入
	 * 
	 * @param filecsv
	 *            文件(路径+文件)
	 * @return
	 */
	public static List<String> importCsv(File file) {
		List<String> dataList = new ArrayList<String>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(file));
			String line = "";
			while ((line = br.readLine()) != null) {
				dataList.add(line);
			}
		} catch (Exception e) {
		} finally {
			if (br != null) {
				try {
					br.close();
					br = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return dataList;
	}

	// public static File createCSVFile(List<Map<String,Object>> exportData,
	// LinkedHashMap rowMapper,
	// String outPutPath, String filename) {
	//
	// File csvFile = null;
	// BufferedWriter csvFileOutputStream = null;
	// try {
	// csvFile = new File(outPutPath + filename + ".csv");
	// // csvFile.getParentFile().mkdir();
	// File parent = csvFile.getParentFile();
	// if (parent != null && !parent.exists()) {
	// parent.mkdirs();
	// }
	// csvFile.createNewFile();
	//
	// //UTF-8 使正确读取分隔符","
	// csvFileOutputStream = new BufferedWriter(new OutputStreamWriter(
	// new FileOutputStream(csvFile), "UTF-8"), 1024);
	// // 写入文件头部
	// for (Iterator propertyIterator = rowMapper.entrySet().iterator();
	// propertyIterator
	// .hasNext();) {
	// java.util.Map.Entry propertyEntry = (java.util.Map.Entry)
	// propertyIterator
	// .next();
	// csvFileOutputStream.write("\""
	// + propertyEntry.getValue().toString() + "\"");
	// if (propertyIterator.hasNext()) {
	// csvFileOutputStream.write(",");
	// }
	// }
	// csvFileOutputStream.newLine();
	// // 写入文件内容
	// for (Iterator iterator = exportData.iterator(); iterator.hasNext();) {
	// Object row = (Object) iterator.next();
	// for (Iterator propertyIterator = rowMapper.entrySet()
	// .iterator(); propertyIterator.hasNext();) {
	// java.util.Map.Entry propertyEntry = (java.util.Map.Entry)
	// propertyIterator
	// .next();
	// csvFileOutputStream.write("\""
	// + BeanUtils.getProperty(row,
	// propertyEntry.getKey().toString())
	// .toString() + "\"");
	// if (propertyIterator.hasNext()) {
	// csvFileOutputStream.write(",");
	// }
	// }
	// if (iterator.hasNext()) {
	// csvFileOutputStream.newLine();
	// }
	// }
	// csvFileOutputStream.flush();
	// } catch (Exception e) {
	// logger.error("Exception", e);
	// } finally {
	// try {
	// csvFileOutputStream.close();
	// } catch (IOException e) {
	// logger.error("IOException", e);
	// }
	// }
	// return csvFile;
	// }

}
