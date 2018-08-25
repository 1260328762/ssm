package model;

    public class Page {
    private int totalCount;
    private int startIndex;
    private int pageSize= Constant.PAGE_SIZE;
    private int prePage;
    private int nextPage;
    private int pageIndex = 1;
    private int pageCount;
    private int start;
    private int end;

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public void setPage(int pageIndex , int totalCount){
        this.totalCount = totalCount;
        //计算总页数
        if(this.totalCount%pageSize==0){
            pageCount = totalCount/pageSize;
        }else{
            pageCount = totalCount/pageSize+1;
        }
        if(pageCount<=0){
            pageCount = 1;
        }
        this.pageIndex = pageIndex;
        //判断页码是否越界
        if(this.pageIndex>pageCount){
            this.pageIndex = pageCount;
            pageIndex = pageCount;
        }

        //计算出开始下标
        this.startIndex = (pageIndex-1)*pageSize;

        //计算出上一页页码
        this.prePage = pageIndex -1;
        if(prePage<=0){
            prePage = 1;
        }
        //计算下一页页码
        this.nextPage = pageIndex+1;
        if(nextPage>=pageCount){
            this.nextPage = pageCount;
        }

        if(pageCount<=5){
            start = 1;
            end = pageCount;
        }else{
            //计算页面显示开始和结束的下标
            if(this.pageIndex == 1){
                this.start = 1;
                this.end = pageIndex + 4;
            }else if(this.pageIndex ==2 ){
                this.start = 1;
                this.end = pageIndex + 3;
            }else{
                this.start = pageIndex - 2;
                this.end = pageIndex+2;
            }

            //计算页面显示的结束下标
            if(end == pageCount){
                end = pageCount;
                start = pageIndex - 2;
            }else if(end == pageCount-1){
                end = pageIndex + 2;
                start = pageIndex - 2;
            }

            //判断页码是否越界
            if(end>=pageCount){
                end = pageCount;
                start = pageCount - 4;
            }
            if(start<=0){
                start = 1;
                end = 5;
            }
        }
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
}
