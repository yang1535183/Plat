package com.diiwon.plat.model;

/*
 * 工程模型
 */
public class TwoDecoration {
    private Integer id;

    private Integer uid;

    private String type;

    private String number;

    private String engname;

    private String engpositionqu;

    private String engpositionlu;

    private String engpositionhao;

    private String cateofinves;

    private String budgetcost;

    private String buildarea;

    private String structuralevel;

    private String costmeter;

    private String state;

    private String info;

    private String detailinfo;

    private String htstate;

    private String path;

    private String htpath;

    private String supervisionlv;

    private Integer supervisionnum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getEngname() {
        return engname;
    }

    public void setEngname(String engname) {
        this.engname = engname == null ? null : engname.trim();
    }

    public String getEngpositionqu() {
        return engpositionqu;
    }

    public void setEngpositionqu(String engpositionqu) {
        this.engpositionqu = engpositionqu == null ? null : engpositionqu.trim();
    }

    public String getEngpositionlu() {
        return engpositionlu;
    }

    public void setEngpositionlu(String engpositionlu) {
        this.engpositionlu = engpositionlu == null ? null : engpositionlu.trim();
    }

    public String getEngpositionhao() {
        return engpositionhao;
    }

    public void setEngpositionhao(String engpositionhao) {
        this.engpositionhao = engpositionhao == null ? null : engpositionhao.trim();
    }

    public String getCateofinves() {
        return cateofinves;
    }

    public void setCateofinves(String cateofinves) {
        this.cateofinves = cateofinves == null ? null : cateofinves.trim();
    }

    public String getBudgetcost() {
        return budgetcost;
    }

    public void setBudgetcost(String budgetcost) {
        this.budgetcost = budgetcost == null ? null : budgetcost.trim();
    }

    public String getBuildarea() {
        return buildarea;
    }

    public void setBuildarea(String buildarea) {
        this.buildarea = buildarea == null ? null : buildarea.trim();
    }

    public String getStructuralevel() {
        return structuralevel;
    }

    public void setStructuralevel(String structuralevel) {
        this.structuralevel = structuralevel == null ? null : structuralevel.trim();
    }

    public String getCostmeter() {
        return costmeter;
    }

    public void setCostmeter(String costmeter) {
        this.costmeter = costmeter == null ? null : costmeter.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }

    public String getDetailinfo() {
        return detailinfo;
    }

    public void setDetailinfo(String detailinfo) {
        this.detailinfo = detailinfo == null ? null : detailinfo.trim();
    }

    public String getHtstate() {
        return htstate;
    }

    public void setHtstate(String htstate) {
        this.htstate = htstate == null ? null : htstate.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getHtpath() {
        return htpath;
    }

    public void setHtpath(String htpath) {
        this.htpath = htpath == null ? null : htpath.trim();
    }

    public String getSupervisionlv() {
        return supervisionlv;
    }

    public void setSupervisionlv(String supervisionlv) {
        this.supervisionlv = supervisionlv == null ? null : supervisionlv.trim();
    }

    public Integer getSupervisionnum() {
        return supervisionnum;
    }

    public void setSupervisionnum(Integer supervisionnum) {
        this.supervisionnum = supervisionnum;
    }

	@Override
	public String toString() {
		return "TwoDecoration [id=" + id + ", uid=" + uid + ", type=" + type + ", number=" + number + ", engname="
				+ engname + ", engpositionqu=" + engpositionqu + ", engpositionlu=" + engpositionlu
				+ ", engpositionhao=" + engpositionhao + ", cateofinves=" + cateofinves + ", budgetcost=" + budgetcost
				+ ", buildarea=" + buildarea + ", structuralevel=" + structuralevel + ", costmeter=" + costmeter
				+ ", state=" + state + ", info=" + info + ", detailinfo=" + detailinfo + ", htstate=" + htstate
				+ ", path=" + path + ", htpath=" + htpath + ", supervisionlv=" + supervisionlv + ", supervisionnum="
				+ supervisionnum + "]";
	}
    
}