package entity;

import utils.Values;

import java.io.Serializable;

public class Notice implements Serializable {
    private int id;
    private String createdate;
    private String startdate;
    private String message;
    private int operator_id;
    private int status;
    private int type;
    private String destids ;
    private String okids;
    private String noids;
    private String destdate;
    private String statusname;
    private String typename;
    private String oname;
    public String getStatusname() {
        return Values.notice_status[status];
    }

    public String getTypename() {
        return Values.notice_type[type];
    }

    public Notice() {
    }

    public Notice(String createdate, String startdate, String message, int operator_id, int status, int type, String destids,String noids,String destdate) {
        this.createdate = createdate;
        this.startdate = startdate;
        this.message = message;
        this.operator_id = operator_id;
        this.status = status;
        this.type = type;
        this.destids = destids;
        this.noids=noids;
        this.destdate=destdate;
    }

    public Notice(int id, String message,String destids, int type) {
        this.id = id;
        this.message = message;
        this.destids = destids;
        this.type = type;
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

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getOperator_id() {
        return operator_id;
    }

    public void setOperator_id(int operator_id) {
        this.operator_id = operator_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDestids() {
        return destids;
    }

    public void setDestids(String destids) {
        this.destids = destids;
    }

    public String getOkids() {
        return okids;
    }

    public void setOkids(String okids) {
        this.okids = okids;
    }

    public String getNoids() {
        return noids;
    }

    public void setNoids(String noids) {
        this.noids = noids;
    }

    public String getDestdate() {
        return destdate;
    }

    public void setDestdate(String destdate) {
        this.destdate = destdate;
    }
}
