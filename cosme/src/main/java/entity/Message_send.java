package entity;

import utils.Values;

import java.io.Serializable;

public class Message_send implements Serializable{
    private int id;
    private String date;
    private int operator_send_id;
    private String operator_dest_ids;
    private String operator_dest_names;
    private int infotype;
    private int infoid;
    private String info;
    private int status;
    private String url_s;
    private String url_p;
    private String statusname;
    private String messageinfotype;
    private String oname;
    public String getStatusname() {
        return Values.message_send_status[status];
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

    public String getMessageinfotype() {
        return Values.message_send_type[infotype];
    }

    public void setMessageinfotype(String messageinfotype) {
        this.messageinfotype = messageinfotype;
    }

    public Message_send() {
    }

    public Message_send(int id, int status) {
        this.id = id;
        this.status = status;
    }

    public Message_send(String date, int operator_send_id, String operator_dest_ids, String operator_dest_names, int infotype, int infoid, String info, int status, String url_s, String url_p) {
        this.date = date;
        this.operator_send_id = operator_send_id;
        this.operator_dest_ids = operator_dest_ids;
        this.operator_dest_names = operator_dest_names;
        this.infotype = infotype;
        this.infoid = infoid;
        this.info = info;
        this.status = status;
        this.url_s = url_s;
        this.url_p = url_p;
    }

    public Message_send(int id, String operator_dest_ids, String operator_dest_names, int infotype, String info, int status, String url_s, String url_p) {
        this.id = id;
        this.operator_dest_ids = operator_dest_ids;
        this.operator_dest_names = operator_dest_names;
        this.infotype = infotype;
        this.info = info;
        this.status = status;
        this.url_s = url_s;
        this.url_p = url_p;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getOperator_send_id() {
        return operator_send_id;
    }

    public void setOperator_send_id(int operator_send_id) {
        this.operator_send_id = operator_send_id;
    }

    public String getOperator_dest_ids() {
        return operator_dest_ids;
    }

    public void setOperator_dest_ids(String operator_dest_ids) {
        this.operator_dest_ids = operator_dest_ids;
    }

    public String getOperator_dest_names() {
        return operator_dest_names;
    }

    public void setOperator_dest_names(String operator_dest_names) {
        this.operator_dest_names = operator_dest_names;
    }

    public int getInfotype() {
        return infotype;
    }

    public void setInfotype(int infotype) {
        this.infotype = infotype;
    }

    public int getInfoid() {
        return infoid;
    }

    public void setInfoid(int infoid) {
        this.infoid = infoid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUrl_s() {
        return url_s;
    }

    public void setUrl_s(String url_s) {
        this.url_s = url_s;
    }

    public String getUrl_p() {
        return url_p;
    }

    public void setUrl_p(String url_p) {
        this.url_p = url_p;
    }
}
