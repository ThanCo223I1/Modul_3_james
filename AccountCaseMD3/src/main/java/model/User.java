package model;

public class User {
    private int id;
    private int count =1;
    private String userName;
    private String passWord;

    public User() {
    }

    public User( String userName, String passWord) {
        this.id = count++;
        this.userName = userName;
        this.passWord = passWord;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

}
