package com.chen.demo;


import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class MyClass {

    static Scanner input = new Scanner(System.in);
    //商品集合
    static List<Goods> list = new ArrayList<>();

    public static void main(String[] args) {
        //进入do-while循环的条件
        boolean flag = true;
        do {
            int id = (list.size()+1);
            System.out.print("商品名称：");
            String name = input.next();
            System.out.print("商品价格：");
            double price = input.nextDouble();
            System.out.print("商品数量：");
            int count = input.nextInt();
            Class aClass = Goods.class;

            try {
                //获取对应参数的构造方法
                Constructor constructor = aClass.getDeclaredConstructor(int.class, String.class, double.class, int.class);
                //这句代码相等于 Goods goods = Goods(1,"王五",1.5,60);
                //把输入的数据放入商品对象中
                Goods goods = (Goods)constructor.newInstance(id, name, price, count);
                //把商品对象goods对象放入集合中，此时的goods对象已经有了你自己输入的数据了
                list.add(goods);
                //问问它是否继续添加商品
                System.out.println("【1 继续添加商品】,【任意键退出即查询】");
                String next = input.next();
                //判断用户输入的不是1，就不进入if块，如果不是1就进入if块把flag改成false退出do-while循环然后展示数据
                if(!next.equals("1")){
                    flag = false;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }while (flag);

        System.out.println("编号\t\t名称\t\t价格\t\t数量");
        //使用增强for循环list集合中的数据
        for (Goods goods : list) {
            System.out.print(goods.getId() + "\t\t");
            System.out.print(goods.getName() + "\t\t");
            System.out.print(goods.getPrice() + "\t\t");
            System.out.println(goods.getCount() + "\t\t");
        }

    }

}
