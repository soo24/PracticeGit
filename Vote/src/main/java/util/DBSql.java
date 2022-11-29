package util;

public enum DBSql {
	readVoteCountSql("select count(isVote) as count from members where isVote=true"),
    updateMemberVoteStatusSql("update members set isVote=? where name=?"),
    updateVoteCountSql("update enter set voteCount=? where enterName=?"),
    readVoteSql("select voteCount from enter where enterName=?"),
    readEnterSql("select * from enter"),
	readMemberSql("SELECT pwd FROM members WHERE pwd=?"),
	readVoteCheckSql("select isVote from members where name=?"),
	readPwdSql("select pwd from members where name=?");
	
	private final String text;
    
	DBSql(String text) {
        this.text = text;
    }
    public String text(){
        return text;
    }
}
