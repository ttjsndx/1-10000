package title;

import java.util.Scanner;

public class TestShare {
	public static void main(String[] args){
		Scanner s = new Scanner(System.in);
		System.out.println("������ѧ��������");
		String studentNum = s.nextLine();
		System.out.println("������ѧ�����ɿ���������ֵ��");
		String studentPlan = s.nextLine();
		System.out.println("�������ɿ�����������");
		String chocolatesNum = s.nextLine();
		System.out.println("�������ɿ�����������");
		String chocolates = s.nextLine();
		
		int stuNum = getInt(studentNum,"ѧ������");
		int[] stuPlan = getIntArr(studentNum,"ѧ�����ɿ���������ֵ");
		int choNum = getInt(studentNum,"�ɿ���������");
		int[] choWeight = getIntArr(studentNum,"�ɿ���������");
		
		if(stuNum == 0 || stuPlan.length == 0 || choNum == 0  || choWeight.length == 0 ){
			return;
		}
		
		
	}
	
	/**
	 * У�������Ƿ�δ����
	 * @param str
	 * @return ��������
	 */
	public static int getInt(String str,String msg){
		if(str == null || str == ""){
			System.out.println(msg + "����Ƿ�");
			return 0;
		}
		if(str.length() > 1 || str.replaceAll("[0-9]", "") != ""){
			System.out.println(msg + "����Ƿ�");
			return 0;
		}
		return Integer.parseInt(str);
	}
	
	/**
	 * У�������Ƿ�δ����
	 * @param str
	 * @return ��������
	 */
	public  static int[] getIntArr(String str,String msg){
		if(str == null || str == ""){
			System.out.println(msg + "����Ƿ�");
			return new int[0];
		}
		if(str.replaceAll("[0-9]", "") != ""){
			System.out.println(msg + "����Ƿ�");
			return new int[0];
		}
		char[] a = str.toCharArray();
	}

}
