package title;

import java.util.Scanner;

public class TestShare {
	public static void main(String[] args){
		Scanner s = new Scanner(System.in);
		System.out.println("请输入学生人数：");
		String studentNum = s.nextLine();
		System.out.println("请输入学生对巧克力的期望值：");
		String studentPlan = s.nextLine();
		System.out.println("请输入巧克力的数量：");
		String chocolatesNum = s.nextLine();
		System.out.println("请输入巧克力的重量：");
		String chocolates = s.nextLine();
		
		int stuNum = getInt(studentNum,"学生人数");
		int[] stuPlan = getIntArr(studentNum,"学生对巧克力的期望值");
		int choNum = getInt(studentNum,"巧克力的数量");
		int[] choWeight = getIntArr(studentNum,"巧克力的重量");
		
		if(stuNum == 0 || stuPlan.length == 0 || choNum == 0  || choWeight.length == 0 ){
			return;
		}
		
		
	}
	
	/**
	 * 校验输入是否未整数
	 * @param str
	 * @return 返回整数
	 */
	public static int getInt(String str,String msg){
		if(str == null || str == ""){
			System.out.println(msg + "输入非法");
			return 0;
		}
		if(str.length() > 1 || str.replaceAll("[0-9]", "") != ""){
			System.out.println(msg + "输入非法");
			return 0;
		}
		return Integer.parseInt(str);
	}
	
	/**
	 * 校验输入是否未整数
	 * @param str
	 * @return 返回整数
	 */
	public  static int[] getIntArr(String str,String msg){
		if(str == null || str == ""){
			System.out.println(msg + "输入非法");
			return new int[0];
		}
		if(str.replaceAll("[0-9]", "") != ""){
			System.out.println(msg + "输入非法");
			return new int[0];
		}
		char[] a = str.toCharArray();
	}

}
