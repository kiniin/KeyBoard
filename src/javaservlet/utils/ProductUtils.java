package javaservlet.utils;

import javaservlet.vo.Product;

import java.util.ArrayList;
import java.util.Comparator;

public class ProductUtils {
    public static ArrayList<Product> compareElem(ArrayList<Product> Products , String attr, int order) {

        if (order==0){
            Products.sort(new Comparator<Product>() {
                @Override

                public int compare(Product o1, Product o2) {
//                    System.out.println(o1.getNumMethod(attr)+","+o2.getNumMethod(attr));
                    return Double.compare(Double.parseDouble(o1.getNumMethod(attr)), Double.parseDouble(o2.getNumMethod(attr)));
                }
            });
        }
        if (order==1){
            Products.sort(new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return Double.compare(Double.parseDouble(o2.getNumMethod(attr)), Double.parseDouble(o1.getNumMethod(attr)));
                }
            });
        }
        return Products;
    }
    public static ArrayList<Product> SortProducts(int way, ArrayList<Product> targetProducts){
        switch (way) {
            case 1:
                return ProductUtils.compareElem(targetProducts, "leftNum", 1);
            case 2:
                return ProductUtils.compareElem(targetProducts, "leftNum", 0);
            case 3:
                return ProductUtils.compareElem(targetProducts, "price", 0);
            case 4:
                return ProductUtils.compareElem(targetProducts, "price", 1);
            default:
                return new ArrayList<>();
        }

    }
}

