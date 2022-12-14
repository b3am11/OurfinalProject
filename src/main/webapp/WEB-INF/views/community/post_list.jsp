<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
	    @font-face {
	    font-family: 'InkLipquid';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/InkLipquid.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      #titleText {
      	font-weight: bold;
      	font-size: 1.25rem;
      }
      
      #writerText{
      	font-size: 0.8rem;
      }
      
      #table1 {
      	 margin-left:auto; 
   		 margin-right:auto;
      }
      
      #maintext{
      	font-family: 'InkLipquid';
      	font-size: 100px;
      	color: white;
      	transform: translate(0, -50%);
      }
      
                
      
    </style>
    
    <script type="text/javascript">
	    function list(page){
	    	location.href="${path}/community/list.do?curPage="+page;
	    } 
    
    </script>
    

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="row-cols-1" id="mainbox" >
      
        <img src="${path}/resources/images/community/banner.png" width="100%" height="100%" id="mainimg" class="img-responsive">
        <div class="card-img-overlay d-flex flex-center">
        	<p id="maintext">How was your day?</p>
		</div>
		<br><br>
		<div class="btn-group">
	       <c:choose>
           <c:when test="${sessionScope.userid == null}">
           	<!-- ??????????????? ?????? ?????? -->
           	<p>
	          <button type="button" onclick="location.href='${path}/member/login.do'" class="btn btn-primary my-1">?????????</button>
	        </p>
           </c:when>
           <c:otherwise>
           <!-- ???????????? ?????? -->
	       <p>
	          <button type="button" onclick="location.href='${path}/community/write.do'" class="btn btn-primary my-1">?????????</button>
	       </p> 
	       </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </section>

 <form id="form1" name="form1" method="post" action="${path}/community/list.do">
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
       <c:forEach var="row" items="${map.list}">   
        <div class="col">
          <div class="card shadow-sm">
            <a href="${path}/community/view.do?comm_no=${row.comm_no}"><img  class="bd-placeholder-img card-img-top" src="${path}/resources/images/community/${row.comm_url}" width="100%" height="225"></a>
            <div class="card-body">
              <p class="card-text" id="writerText"><a href="${path}/community/view.do?comm_no=${row.comm_no}">${row.writer}</a></p>
              <p class="card-text" id="titleText"><a href="${path}/community/view.do?comm_no=${row.comm_no}">${row.comm_title}</a></p>
              
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${path}/community/view.do?comm_no=${row.comm_no}'">???? ${row.comm_viewcnt}</button>
                  
                </div>
                <small class="text-muted">${row.comm_regdate}</small>
              </div>
            </div>
          </div>
        </div>
       </c:forEach>
      </div>
    </div>     
  </div>
 </form>
 
 

<!-- ????????? ??????????????? ?????? -->
<table id="table1">
	<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">&laquo;</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				&lt;</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- ?????? ???????????? ?????? ??????????????? ?????? -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">&gt;</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">&raquo;</a>
			</c:if>
		</td>
	</tr>
</table>
  
</main>

<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Copyright 2022. OdokOdok All rights reserved.</p>
    <p class="mb-0"><a href="${path}/">Visit the main</a> or read our <a href="${path}/notice/list.do">getting started guide</a>.</p>
  </div>
</footer>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>