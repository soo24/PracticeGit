package util;

public enum ImgLink {
	LeeYoungZyImg("https://img.insight.co.kr/static/2020/09/05/700/qf7wv05d0qf80epj2ko4.jpg"),
	MaDongSuckImg("http://bigpunchent.com/public/img/sub/arti01-1.jpg"),
	HanSoHeeImg("https://www.smlounge.co.kr/upload/woman/article/202112/thumb/49686-473794-sample.jpg"),
	LeeJongSuckImg("https://img.vogue.co.kr/vogue/2022/09/style_6329748d7fd5f.jpg"),
	WaitImg("http://thumbnail.10x10.co.kr/webimage/image/basic600/341/B003419123.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false");
	
	private final String url;
    
	ImgLink(String url) {
        this.url = url;
    }
    public String url(){
        return url;
    }
}
