package cn.appsys.pojo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * app信息类
 * 
 * @author 117
 *
 */
public class AppInfo {
	/**
	 * 主键id
	 */
	private Integer id;
	/**
	 * 软件名称
	 */
	private String softwareName;
	/**
	 * APK名称
	 */
	private String APKName;
	/**
	 * 支持ROM
	 */
	private String supportROM;
	/**
	 * 界面语言
	 */
	private String interfaceLanguage;
	/**
	 * 更新日期
	 */
	private Date updateDate;
	/**
	 * 软件大小（单位：M）
	 */
	private BigDecimal softwareSize;
	/**
	 * 开发者id
	 */
	private Integer devId;
	/**
	 * 应用简介
	 */
	private String appInfo;
	/**
	 * app状态id
	 */
	private Integer status;
	/**
	 * 上架时间
	 */
	private Date onSaleDate;
	/**
	 * 下架时间
	 */
	private Date offSaleDate;
	/**
	 * 所属三级分类id
	 */
	private Integer categoryLevel3;
	/**
	 * 下载量（单位：次）
	 */
	private Integer downloads;
	/**
	 * app所属平台id
	 */
	private Integer flatformId;
	/**
	 * 创建者
	 */
	private Integer createdBy;
	/**
	 * 创建时间
	 */
	private Date creationDate;
	/**
	 * 更新者
	 */
	private Integer modifyBy;
	/**
	 * 更新时间
	 */
	private Date modifyDate;

	/**
	 * app状态名称
	 */
	private String statusName;
	/**
	 * app所属平台名称
	 */
	private String flatformName;
	/**
	 * 所属三级分类名称
	 */
	private String categoryLevel3Name;
	/**
	 * 开发者名称
	 */
	private String devName;

	/**
	 * 所属一级分类id
	 */
	private Integer categoryLevel1;
	/**
	 * 所属二级分类id
	 */
	private Integer categoryLevel2;

	/**
	 * 所属一级分类名称
	 */
	private String categoryLevel1Name;
	/**
	 * 所属二级分类名称
	 */
	private String categoryLevel2Name;

	/**
	 * LOGO图片URL路径
	 */
	private String logoPicPath;
	/**
	 * LOGO图片的服务器存储路径
	 */
	private String logoLocPath;

	/**
	 * 最新的版本id
	 */
	private Integer versionId;
	/**
	 * 最新的版本号
	 */
	private String versionNo;

	public AppInfo() {
		super();
	}

	@Override
	public String toString() {
		return "AppInfo [id=" + id + ", softwareName=" + softwareName + ", APKName=" + APKName + ", supportROM="
				+ supportROM + ", interfaceLanguage=" + interfaceLanguage + ", updateDate=" + updateDate
				+ ", softwareSize=" + softwareSize + ", devId=" + devId + ", appInfo=" + appInfo + ", status=" + status
				+ ", onSaleDate=" + onSaleDate + ", offSaleDate=" + offSaleDate + ", categoryLevel3=" + categoryLevel3
				+ ", downloads=" + downloads + ", flatformId=" + flatformId + ", createdBy=" + createdBy
				+ ", creationDate=" + creationDate + ", modifyBy=" + modifyBy + ", modifyDate=" + modifyDate
				+ ", statusName=" + statusName + ", flatformName=" + flatformName + ", categoryLevel3Name="
				+ categoryLevel3Name + ", devName=" + devName + ", categoryLevel1=" + categoryLevel1
				+ ", categoryLevel2=" + categoryLevel2 + ", categoryLevel1Name=" + categoryLevel1Name
				+ ", categoryLevel2Name=" + categoryLevel2Name + ", logoPicPath=" + logoPicPath + ", logoLocPath="
				+ logoLocPath + ", versionId=" + versionId + ", versionNo=" + versionNo + "]";
	}

	public String getVersionNo() {
		return versionNo;
	}

	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}

	public Integer getVersionId() {
		return versionId;
	}

	public void setVersionId(Integer versionId) {
		this.versionId = versionId;
	}

	public String getLogoLocPath() {
		return logoLocPath;
	}

	public void setLogoLocPath(String logoLocPath) {
		this.logoLocPath = logoLocPath;
	}

	public String getLogoPicPath() {
		return logoPicPath;
	}

	public void setLogoPicPath(String logoPicPath) {
		this.logoPicPath = logoPicPath;
	}

	public Integer getCategoryLevel3() {
		return categoryLevel3;
	}

	public void setCategoryLevel3(Integer categoryLevel3) {
		this.categoryLevel3 = categoryLevel3;
	}

	public String getCategoryLevel3Name() {
		return categoryLevel3Name;
	}

	public void setCategoryLevel3Name(String categoryLevel3Name) {
		this.categoryLevel3Name = categoryLevel3Name;
	}

	public String getCategoryLevel1Name() {
		return categoryLevel1Name;
	}

	public void setCategoryLevel1Name(String categoryLevel1Name) {
		this.categoryLevel1Name = categoryLevel1Name;
	}

	public String getCategoryLevel2Name() {
		return categoryLevel2Name;
	}

	public void setCategoryLevel2Name(String categoryLevel2Name) {
		this.categoryLevel2Name = categoryLevel2Name;
	}

	public Integer getCategoryLevel1() {
		return categoryLevel1;
	}

	public void setCategoryLevel1(Integer categoryLevel1) {
		this.categoryLevel1 = categoryLevel1;
	}

	public Integer getCategoryLevel2() {
		return categoryLevel2;
	}

	public void setCategoryLevel2(Integer categoryLevel2) {
		this.categoryLevel2 = categoryLevel2;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getFlatformName() {
		return flatformName;
	}

	public void setFlatformName(String flatformName) {
		this.flatformName = flatformName;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSoftwareName() {
		return softwareName;
	}

	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}

	public String getAPKName() {
		return APKName;
	}

	public void setAPKName(String aPKName) {
		APKName = aPKName;
	}

	public String getSupportROM() {
		return supportROM;
	}

	public void setSupportROM(String supportROM) {
		this.supportROM = supportROM;
	}

	public String getInterfaceLanguage() {
		return interfaceLanguage;
	}

	public void setInterfaceLanguage(String interfaceLanguage) {
		this.interfaceLanguage = interfaceLanguage;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public BigDecimal getSoftwareSize() {
		return softwareSize;
	}

	public void setSoftwareSize(BigDecimal softwareSize) {
		this.softwareSize = softwareSize;
	}

	public Integer getDevId() {
		return devId;
	}

	public void setDevId(Integer devId) {
		this.devId = devId;
	}

	public String getAppInfo() {
		return appInfo;
	}

	public void setAppInfo(String appInfo) {
		this.appInfo = appInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getOnSaleDate() {
		return onSaleDate;
	}

	public void setOnSaleDate(Date onSaleDate) {
		this.onSaleDate = onSaleDate;
	}

	public Date getOffSaleDate() {
		return offSaleDate;
	}

	public void setOffSaleDate(Date offSaleDate) {
		this.offSaleDate = offSaleDate;
	}

	public Integer getDownloads() {
		return downloads;
	}

	public void setDownloads(Integer downloads) {
		this.downloads = downloads;
	}

	public Integer getFlatformId() {
		return flatformId;
	}

	public void setFlatformId(Integer flatformId) {
		this.flatformId = flatformId;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Integer getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(Integer modifyBy) {
		this.modifyBy = modifyBy;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
}
