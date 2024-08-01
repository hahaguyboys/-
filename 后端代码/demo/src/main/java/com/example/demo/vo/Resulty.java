package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Resulty<T> {
    public int code;
    public String msg;
    public Object data;

    public static <Object> Resulty success() {
        Resulty r= new Resulty(0,"suc",null);
        return r;
    }

    public static <Object> Resulty success(Object data) {
        Resulty r= new Resulty(0,"suc",data);
        return r;
    }

    private Resulty(int code, String msg, Object data){
        this.code=0;
        this.msg="suc";
        this.data=data;
    }

    public static <Object> Resulty failed () {
        Resulty r=new Resulty(1,"fail","失败");
        return r;
    }

}
