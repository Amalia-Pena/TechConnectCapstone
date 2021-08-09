package com.techelevator.model;

public class Assistance_Media {
    // Instance variables
    private Long assistance_id;
    private Long equipment_id;
    private String photo_link;
    private String photo_name;
    private String video_link;
    private String video_name;
    private String animation_link;
    private String animation_name;

    // Getters

    public Long getAssistance_id() {
        return assistance_id;
    }

    public Long getEquipment_id() {
        return equipment_id;
    }

    public String getPhoto_link() {
        return photo_link;
    }

    public String getPhoto_name() {
        return photo_name;
    }

    public String getVideo_link() {
        return video_link;
    }

    public String getVideo_name() {
        return video_name;
    }

    public String getAnimation_link() {
        return animation_link;
    }

    public String getAnimation_name() {
        return animation_name;
    }

    // Setters

    public void setAssistance_id(Long assistance_id) {
        this.assistance_id = assistance_id;
    }

    public void setEquipment_id(Long equipment_id) {
        this.equipment_id = equipment_id;
    }

    public void setPhoto_link(String photo_link) {
        this.photo_link = photo_link;
    }

    public void setPhoto_name(String photo_name) {
        this.photo_name = photo_name;
    }

    public void setVideo_link(String video_link) {
        this.video_link = video_link;
    }

    public void setVideo_name(String video_name) {
        this.video_name = video_name;
    }

    public void setAnimation_link(String animation_link) {
        this.animation_link = animation_link;
    }

    public void setAnimation_name(String animation_name) {
        this.animation_name = animation_name;
    }
}
