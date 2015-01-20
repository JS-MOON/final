package com.exe.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by JS on 2014-12-01.
 */
public class DivideOptions {

    public List<String> parse(String options) {
        List<String> list = new ArrayList<String>();
        String[] optionPairArray;

        if(!options.equals("")) {
            if(options.contains("&")) {
                optionPairArray = options.split("&");
            } else {
                optionPairArray = new String[1];
                optionPairArray[0] = options;
            }

            for (int i=0; i<optionPairArray.length; i++) {
                String[] temp = optionPairArray[i].split("/");

                list.add(temp[0]);
                list.add(temp[1]);
            }
        }
        return list;
    }

}
