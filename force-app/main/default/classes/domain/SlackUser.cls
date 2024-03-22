public class SlackUser {
    private String id;
    private String team_id;
    private String name;
    private Boolean deleted;
    private String color;
    private String real_name;
    private String tz;
    private String tz_label;
    // in s
    private Integer tz_offset;
    private Boolean is_admin;
    private Boolean is_owner;
    private Boolean is_primary_owner;
    private Boolean is_restricted;
    private Boolean is_ultra_restricted;
    private Boolean is_bot;
    private Long updated;
    private Boolean is_app_user;
    private Boolean has_2fa;
    private SlackProfile profile;

    // Only created through deserialization?
    private SlackUser() {}

    public String getId() {
        return id;
    }

    public String getTeamId() {
        return team_id;
    }

    public String getName() {
        return name;
    }

    public Boolean getDeleted() {
        return deleted;
    }
    
    public String getColor() {
        return color;
    }

    public String getRealName() {
        return real_name;
    }

    public String getTz() {
        return tz;
    }

    public String getTzLabel() {
        return tz_label;
    }

    public Integer getTzOffset() {
        return tz_offset;
    }

    public Boolean getIsAdmin() {
        return is_admin;
    }

    public Boolean getIsOwner() {
        return is_owner;
    }

    public Boolean getIsPrimaryOwner() {
        return is_primary_owner;
    }

    public Boolean getIsRestricted() {
        return is_restricted;
    }

    public Boolean getIsUltraRestricted() {
        return is_ultra_restricted;
    }

    public Boolean getIsBot() {
        return is_bot;
    }

    public Long getUpdated() {
        return updated;
    }

    public Boolean getIsAppUser() {
        return is_app_user;
    }

    public Boolean getHas2fa() {
        return has_2fa;
    }

    public SlackProfile getProfile() {
        return profile;
    }

    // If ever needed outside of a user context, make own class
    public class SlackProfile {
        private String avatar_hash;
        private String status_text;
        private String status_emoji;
        private String real_name;
        private String display_name;
        private String real_name_normalized;
        private String display_name_normalized;
        private String email;
        private String image_24;
        private String image_32;
        private String image_48;
        private String image_72;
        private String image_192;
        private String image_512;
        private String team;

        // Only created through deserialization?
        private SlackProfile() {}

        public String getAvatarHash() {
            return avatar_hash;
        }

        public String getStatusText() {
            return status_text;
        }

        public String getStatusEmoji() {
            return status_emoji;
        }

        public String getRealName() {
            return real_name;
        }

        public String getDisplayName() {
            return display_name;
        }

        public String getRealNameNormalized() {
            return real_name_normalized;
        }

        public String getDisplayNameNormalized() {
            return display_name_normalized;
        }

        public String getEmail() {
            return email;
        }

        public String getImage24() {
            return image_24;
        }

        public String getImage32() {
            return image_32;
        }

        public String getImage48() {
            return image_48;
        }        

        public String getImage72() {
            return image_72;
        }

        public String getImage192() {
            return image_192;
        }

        public String getImage512() {
            return image_512;
        }

        // Same as SlackUser.team_id
        public String getTeam() {
            return team;
        }        
    }
}