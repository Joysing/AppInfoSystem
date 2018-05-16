package cn.appsys.pojo;

import java.util.Date;

/**
 * 广告推广实体类
 * 
 * @author 117
 *
 */
public class AdPromotion {
	private Integer id;// 主键ID
	/**
	 * appId
	 */
	private Integer appId;
	/**
	 * 广告图片存储路径
	 */
	private String adPicPath;
	/**
	 * 广告点击量
	 */
	private Integer adPV;
	/**
	 * 轮播位（1-n）
	 */
	private Integer carouselPosition;
	/**
	 * 广告起效时间
	 */
	private Date startTime;
	/**
	 * 广告失效时间
	 */
	private Date endTime;
	/**
	 * 创建者id
	 */
	private Integer createdBy;
	/**
	 * 创建时间
	 */
	private Date creationDate;
	/**
	 * 更新者id
	 */
	private Integer modifyBy;
	/**
	 * 更新时间
	 */
	private Date modifyDate;

	public AdPromotion() {
		super();
	}

	@Override
	public String toString() {
		return "AdPromotion [id=" + id + ", appId=" + appId + ", adPicPath=" + adPicPath + ", adPV=" + adPV
				+ ", carouselPosition=" + carouselPosition + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", createdBy=" + createdBy + ", creationDate=" + creationDate + ", modifyBy=" + modifyBy
				+ ", modifyDate=" + modifyDate + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getAdPicPath() {
		return adPicPath;
	}

	public void setAdPicPath(String adPicPath) {
		this.adPicPath = adPicPath;
	}

	public Integer getAdPV() {
		return adPV;
	}

	public void setAdPV(Integer adPV) {
		this.adPV = adPV;
	}

	public Integer getCarouselPosition() {
		return carouselPosition;
	}

	public void setCarouselPosition(Integer carouselPosition) {
		this.carouselPosition = carouselPosition;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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
