package com.diiwon.plat.model;
/*
 * 工程审查意见记录
 */
public class Record {
    private Integer id;

    private Integer tid;

    private String rdate;

    private String raction;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate == null ? null : rdate.trim();
    }

    public String getRaction() {
        return raction;
    }

    public void setRaction(String raction) {
        this.raction = raction == null ? null : raction.trim();
    }

	@Override
	public String toString() {
		return "Record [id=" + id + ", tid=" + tid + ", rdate=" + rdate + ", raction=" + raction + "]";
	}
}