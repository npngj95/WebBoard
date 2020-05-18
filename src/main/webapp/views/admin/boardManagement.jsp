<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<!-- Table with panel -->
<div class="card card-cascade narrower wrapper">

  <!--Card image-->
  <div
    class="view view-cascade gradient-card-header btn-teal narrower py-2 mx-4 mb-3 d-flex justify-content-between align-items-center">

    <div>
      <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
      </button>
      <!-- <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
      </button> -->
    </div>

    <a href="" class="white-text mx-3">게시글 관리</a>

    <div>
      <!-- <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
        <i class="fas fa-pencil-alt mt-0"></i>
      </button> -->
      <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
        <i class="far fa-trash-alt mt-0"></i>
      </button>
    </div>

  </div>
  <!--/Card image-->

  <div class="px-5">

    <div class="table-wrapper">
      <!--Table-->
      <table class="table table-hover mb-0">

        <!--Table head-->
        <thead>
          <tr>
            <th width="2%" class="text-center">  </th>
            <th width="5%" class="text-center">Category</th>
            <th class="text-left">Title</th>
            <th width="10%" class="text-center">Writer</th>
            <th width="10%" class="text-center">Input Date</th>
            <th width="8%" class="text-center">Remove</th>
          </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
          <tr>
            <th scope="row">
              <input class="form-check-input" type="checkbox" id="checkbox1">
              <label class="form-check-label" for="checkbox1" class="label-table"></label>
            </th>
            <td>질문</td>
            <td>####집 어때요?</td>
            <td class="text-center">@mdo</td>
            <td class="text-center">2020-05-15</td>
            <td>
              <span class="table-remove"><button type="button"
                  class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
            </td>
          </tr>
          <tr>
            <th scope="row">
              <input class="form-check-input" type="checkbox" id="checkbox2">
              <label class="form-check-label" for="checkbox2" class="label-table"></label>
            </th>
            <td>리뷰</td>
            <td>@@@집 후기입니다 ~</td>
            <td class="text-center">@fat</td>
            <td class="text-center">2020-05-14</td>
            <td>
              <span class="table-remove"><button type="button"
                  class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
            </td>
          </tr>
        </tbody>
        <!--Table body-->
      </table>
      <!--Table-->
    </div>

  </div>

</div>
<!-- Table with panel -->
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>