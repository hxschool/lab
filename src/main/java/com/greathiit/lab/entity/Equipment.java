package com.greathiit.lab.entity;

public class Equipment {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column equipment.equ_oid
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    private String equOid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column equipment.equ_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    private String equId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column equipment.equ_count
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    private Integer equCount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column equipment.labor_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    private Integer laborId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column equipment.etype_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    private String etypeId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column equipment.equ_oid
     *
     * @return the value of equipment.equ_oid
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public String getEquOid() {
        return equOid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column equipment.equ_oid
     *
     * @param equOid the value for equipment.equ_oid
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public void setEquOid(String equOid) {
        this.equOid = equOid == null ? null : equOid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column equipment.equ_id
     *
     * @return the value of equipment.equ_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public String getEquId() {
        return equId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column equipment.equ_id
     *
     * @param equId the value for equipment.equ_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public void setEquId(String equId) {
        this.equId = equId == null ? null : equId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column equipment.equ_count
     *
     * @return the value of equipment.equ_count
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public Integer getEquCount() {
        return equCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column equipment.equ_count
     *
     * @param equCount the value for equipment.equ_count
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public void setEquCount(Integer equCount) {
        this.equCount = equCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column equipment.labor_id
     *
     * @return the value of equipment.labor_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public Integer getLaborId() {
        return laborId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column equipment.labor_id
     *
     * @param laborId the value for equipment.labor_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public void setLaborId(Integer laborId) {
        this.laborId = laborId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column equipment.etype_id
     *
     * @return the value of equipment.etype_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public String getEtypeId() {
        return etypeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column equipment.etype_id
     *
     * @param etypeId the value for equipment.etype_id
     *
     * @mbggenerated Sun Apr 22 09:19:18 CST 2018
     */
    public void setEtypeId(String etypeId) {
        this.etypeId = etypeId == null ? null : etypeId.trim();
    }
}