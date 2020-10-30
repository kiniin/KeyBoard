package javaservlet.utils;

import javaservlet.vo.Order;
import javaservlet.vo.Product;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Comparator;

public class OrderUtils {

    public static ArrayList<Order>
        compareElem(ArrayList<Order> orders){
        orders.sort(new Comparator<Order>() {
            @Override
            public int compare(Order o1, Order o2) {
//                    System.out.println(o1.getNumMethod(attr)+","+o2.getNumMethod(attr));
                return Long.compare(o2.getDate().getTime(), o1.getDate().getTime());
            }
        });
        return orders;
    }
}
