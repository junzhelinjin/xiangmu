package entity;

import utils.Values;

import java.io.Serializable;

public class Message implements Serializable {
    private int id;
    private String date;
    private int send_id;
    private int operator_send_id;
    private int operator_dest_id;
    private int infotype;
    private int info_id;
    private String info;
    private int status;
    private String readdate;
    private String url_s;
    private String url_p;
    private String oname;
    private String statusname;
    private String typename;

    public String getTypename() {
        return Values.notice_type[infotype];
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getStatusname() {
        return Values.notice_status[status];
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public Message() {
    }

    public Message(String date, int send_id, int operator_send_id, int operator_dest_id, int infotype, int info_id, String info, int status,String url_s, String url_p) {
        this.date = date;
        this.send_id = send_id;
        this.operator_send_id = operator_send_id;
        this.operator_dest_id = operator_dest_id;
        this.infotype = infotype;
        this.info_id = info_id;
        this.info = info;
        this.status = status;
        this.url_s = url_s;
        this.url_p = url_p;
    }

    public Message(int id, String date, int send_id, int operator_send_id, int operator_dest_id, int infotype, int info_id, String info, int status, String readdate, String url_s, String url_p) {
        this.id = id;
        this.date = date;
        this.send_id = send_id;
        this.operator_send_id = operator_send_id;
        this.operator_dest_id = operator_dest_id;
        this.infotype = infotype;
        this.info_id = info_id;
        this.info = info;
        this.status = status;
        this.readdate = readdate;
        this.url_s = url_s;
        this.url_p = url_p;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getSend_id() {
        return send_id;
    }

    public void setSend_id(int send_id) {
        this.send_id = send_id;
    }

    public int getOperator_send_id() {
        return operator_send_id;
    }

    public void setOperator_send_id(int operator_send_id) {
        this.operator_send_id = operator_send_id;
    }

    public int getOperator_dest_id() {
        return operator_dest_id;
    }

    public void setOperator_dest_id(int operator_dest_id) {
        this.operator_dest_id = operator_dest_id;
    }

    public int getInfotype() {
        return infotype;
    }

    public void setInfotype(int infotype) {
        this.infotype = infotype;
    }

    public int getInfo_id() {
        return info_id;
    }

    public void setInfo_id(int info_id) {
        this.info_id = info_id;
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

    public String getReaddate() {
        return readdate;
    }

    public void setReaddate(String readdate) {
        this.readdate = readdate;
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
