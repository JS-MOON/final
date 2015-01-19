<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 3:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>

<style type="text/css">
    body {
        /*font-size: 0px;*/
        font-family: 'ng', 'NanumGothic', '나눔 고딕', dotum, '돋움', gulim, '굴림', Georgia, helvetica, sans-serif, Arial, verdana;
        color: #777777;
        background: #ffffff;
    }

    li {
        vertical-align: top;
    }

    div #ADMain {
        font-size: 0px;
    }
</style>


<div id="ADMain" align="center" style="border: 0px; padding: 0px; margin: 0px;">
    <div align="cneter" sytle="width: 100%; height: 405px;">
        <img src="../resources/images/AD/AD_01.jpg" />
    </div>
    <div align="center" style="background-color: #f2f2f2; width: 982px;">
        <img src="../resources/images/AD/AD_02.jpg" />
    </div>

    <!-- 상단배너스타일 시작 -->
    <div id="ContentPlaceHolder1_WUC_ADMain_TopBanner">
        <div id="nominate" style="padding-bottom: 26px;">
            <div>
                <ul>
                    <li style="display: inline-block;">
                        <div style="width: 175px;">
                            <img src="../resources/images/AD/AD_Nominate_01.jpg" width="175" height="270" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Nominate_02.jpg); width: 175px; height: 36px;">
                                <div style="padding-top: 10px;">
                                    <strong>
                                        <span style="font-size: 12px; text-align: center; color: #1f2022">오늘 + </span>
                                    </strong>
                                            <span style="font-size: 12px; text-align: center;">
                                                <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlRecommandDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlRecommandDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlRecommandDays">
                                                    <option selected="selected" value="3">3</option>
                                                    <option value="7$5">7</option>
                                                    <option value="14$10">14</option>

                                                </select>
                                            </span>
                                    <strong>
                                                <span style="font-size: 12px; text-align: center; color: #1f2022">&nbsp;일
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <img src="../resources/images/AD/AD_Nominate_03.jpg" width="175" height="14" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Nominate_04.jpg); width: 175px; height: 18px; padding-top: 2px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 12px; color: #ed1442;">

                                                </span>
                                    </strong>
                                    <strong>
                                                <span style="font-size: 12px; color: #7c8088">

                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url(../resources/images/AD/AD_Nominate_05.jpg); width: 175px; height: 32px; padding-top: 6px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 16px; color: #1f2022">
                                                    25,000원
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url('../resources/images/AD/AD_Nominate_06.jpg'); width: 175px; height: 50px; margin-right: 0px;">
                                <div style="padding-top: 5px;">
                                    <a id="ContentPlaceHolder1_WUC_ADMain_lbtnRecommandSelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnRecommandSelect&#39;,&#39;&#39;)" style="display:inline-block;height:32px;width:128px;">선택</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block;">
                        <div>
                            <img src="../resources/images/AD/AD_Nominate_07.jpg" width="827" height="428" />
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div id="static" style="padding-bottom: 26px;">
            <div>
                <ul>
                    <li style="display: inline-block;">
                        <div style="width: 175px;">
                            <img src="../resources/images/AD/AD_Static_01.jpg" width="175" height="270" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Static_02.jpg); width: 175px; height: 36px;">
                                <div style="padding-top: 10px;">
                                    <strong>
                                        <span style="font-size: 12px; text-align: center; color: #1f2022">오늘 + </span>
                                    </strong>
                                            <span style="font-size: 12px; text-align: center;">
                                                <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlBannerDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlBannerDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlBannerDays">
                                                    <option selected="selected" value="3">3</option>
                                                    <option value="7">7</option>
                                                    <option value="14$10">14</option>
                                                    <option value="21$14">21</option>
                                                    <option value="28$19">28</option>

                                                </select>
                                            </span>
                                    <strong>
                                                <span style="font-size: 12px; text-align: center; color: #1f2022">&nbsp;일
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <img src="../resources/images/AD/AD_Static_03.jpg" width="175" height="14" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Static_04.jpg); width: 175px; height: 18px; padding-top: 2px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 12px; color: #ed1442;">

                                                </span>
                                    </strong>
                                    <strong>
                                                <span style="font-size: 12px; color: #7c8088">

                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url(../resources/images/AD/AD_Static_05.jpg); width: 175px; height: 32px; padding-top: 6px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 16px; color: #1f2022">
                                                    14,000원
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url('../resources/images/AD/AD_Static_06.jpg'); width: 175px; height: 50px; margin-right: 0px;">
                                <div style="padding-top: 5px;">
                                    <a id="ContentPlaceHolder1_WUC_ADMain_lbtnBannerSelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnBannerSelect&#39;,&#39;&#39;)" style="display:inline-block;height:32px;width:128px;">선택</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block;">
                        <div>
                            <img src="../resources/images/AD/AD_Static_07.jpg" width="827" height="428" />
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div id="category" style="padding-bottom: 26px;">
            <div>
                <ul>
                    <li style="display: inline-block;">
                        <div style="width: 175px;">
                            <img src="../resources/images/AD/AD_Category_01.jpg" width="175" height="271" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Category_02.jpg); width: 175px; height: 34px;">
                                <div style="padding-top: 10px;">
                                    <strong>
                                        <span style="font-size: 12px; text-align: center; color: #1f2022">오늘 + </span>
                                    </strong>
                                            <span style="font-size: 12px; text-align: center;">
                                                <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlCategoryDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlCategoryDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlCategoryDays">
                                                    <option selected="selected" value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7$10">7</option>
                                                    <option value="14$15">14</option>

                                                </select>
                                            </span>
                                    <strong>
                                                <span style="font-size: 12px; text-align: center; color: #1f2022">&nbsp;일
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <img src="../resources/images/AD/AD_Category_03.jpg" width="175" height="14" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Category_04.jpg); width: 175px; height: 20px; padding-top: 2px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 12px; color: #ed1442;">

                                                </span>
                                    </strong>
                                    <strong>
                                                <span style="font-size: 12px; color: #7c8088">

                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url(../resources/images/AD/AD_Category_05.jpg); width: 175px; height: 30px; padding-top: 6px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 16px; color: #1f2022">
                                                    15,000원
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url('../resources/images/AD/AD_Category_06.jpg'); width: 175px; height: 52px; margin-right: 0px;">
                                <div style="padding-top: 5px;">
                                    <a id="ContentPlaceHolder1_WUC_ADMain_lbtnCategorySelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnCategorySelect&#39;,&#39;&#39;)" style="display:inline-block;height:32px;width:128px;">선택</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block;">
                        <div>
                            <img src="../resources/images/AD/AD_Category_07.jpg" width="827" height="429" border="0" />
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div id="side" style="padding-bottom: 26px;">
            <div>
                <ul>
                    <li style="display: inline-block;">
                        <div style="width: 175px;">
                            <img src="../resources/images/AD/AD_Side_01.jpg" width="175" height="271" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Side_02.jpg); width: 175px; height: 34px;">
                                <div style="padding-top: 10px;">
                                    <strong>
                                        <span style="font-size: 12px; text-align: center; color: #1f2022">오늘 + </span>
                                        &nbsp;</strong><span style="font-size: 12px; text-align: center;"><select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlSideDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlSideDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlSideDays">
                                    <option selected="selected" value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7$13">7</option>
                                    <option value="14$18">14</option>

                                </select>
                                                </span>
                                    <strong>
                                                <span style="font-size: 12px; text-align: center; color: #1f2022">&nbsp;일
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <img src="../resources/images/AD/AD_Category_03.jpg" width="175" height="14" border="0" />
                            <div style="background-image: url(../resources/images/AD/AD_Category_04.jpg); width: 175px; height: 20px; padding-top: 2px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 12px; color: #ed1442;">

                                                </span>
                                    </strong>
                                    <strong>
                                                <span style="font-size: 12px; color: #7c8088">

                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url(../resources/images/AD/AD_Category_05.jpg); width: 175px; height: 30px; padding-top: 6px;">
                                <div>
                                    <strong>
                                                <span style="font-size: 16px; color: #1f2022">
                                                    7,700원
                                                </span>
                                    </strong>
                                </div>
                            </div>
                            <div style="background-image: url('../resources/images/AD/AD_Side_05.jpg'); width: 175px; height: 55px; margin-right: 0px;">
                                <div style="padding-top: 11px;">
                                    <a id="ContentPlaceHolder1_WUC_ADMain_lbtnSideSelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnSideSelect&#39;,&#39;&#39;)" style="display:inline-block;height:32px;width:128px;">선택</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block;">
                        <div>
                            <img src="../resources/images/AD/AD_Side_06.jpg" width="827" height="433" border="0" />
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 상단배너스타일 종료 -->

    <!-- 중간배너스타일 시작 -->
    <div id="ContentPlaceHolder1_WUC_ADMain_side2" style="padding-bottom: 26px; background-color: #e1e1e1; display: none;">
        <div>
            <ul>
                <li style="display: inline-block;">
                    <img src="../resources/images/AD/AD2_Screen.jpg" width="1002" height="438" border="0" />
                </li>
            </ul>
            <ul>
                <li style="display: inline-block;">
                    <div style="width: 250px;">
                        <div style="background-image: url(../resources/images/AD/AD2_Side_01.jpg); width: 250px; height: 50px;">
                            <div style="padding-top: 15px;">
                                <strong>
                                    <span style="font-size: 18px; text-align: center;">오늘 + </span>
                                </strong>
                                        <span style="font-size: 18px; text-align: center;">
                                            <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGSideDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGSideDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlGSideDays">
                                                <option selected="selected" value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7$13">7</option>
                                                <option value="14$18">14</option>

                                            </select>
                                            &nbsp;</span><strong><span style="font-size: 18px; text-align: center;">&nbsp;일
                                            </span>
                            </strong>
                            </div>
                        </div>
                        <img src="../resources/images/AD/AD2_Side_02.jpg" width="250" height="24" border="0" />
                        <div style="background-image: url(../resources/images/AD/AD2_Side_03.jpg); width: 250px; height: 34px; padding-top: 0px;">
                            <div>
                                <strong>
                                            <span style="font-size: 18px; color: #ed1442;">

                                            </span>
                                </strong>
                                <strong>
                                            <span style="font-size: 18px; color: #b3b8c3">

                                            </span>
                                </strong>
                            </div>
                        </div>
                        <div style="background-image: url(../resources/images/AD/AD2_Side_04.jpg); width: 250px; height: 42px">
                            <div>
                                <strong>
                                            <span style="font-size: 24px; color: #1f2022">
                                                7,700원
                                            </span>
                                </strong>
                            </div>
                        </div>
                        <div style="background-image: url('../resources/images/AD/AD2_Side_05.jpg'); width: 250px; height: 75px; margin-right: 0px;">
                            <div style="padding-top: 3px;">
                                <a id="ContentPlaceHolder1_WUC_ADMain_lbtnGSideSelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnGSideSelect&#39;,&#39;&#39;)" style="display:inline-block;height:46px;width:185px;">선택</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="display: inline-block;">
                    <div style="width: 250px;">
                        <div style="background-image: url(../resources/images/AD/AD2_Category_01.jpg); width: 250px; height: 50px;">
                            <div style="padding-top: 15px;">
                                <strong>
                                    <span style="font-size: 18px; text-align: center;">오늘 + </span>
                                </strong>
                                        <span style="font-size: 18px; text-align: center;">
                                            <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGCategoryDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGCategoryDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlGCategoryDays">
                                                <option selected="selected" value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7$10">7</option>
                                                <option value="14$15">14</option>

                                            </select>
                                        </span>
                                <strong>
                                            <span style="font-size: 18px; text-align: center;">&nbsp;일
                                            </span>
                                </strong>
                            </div>
                        </div>
                        <img src="../resources/images/AD/AD2_Category_02.jpg" width="250" height="24" border="0" />
                        <div style="background-image: url(../resources/images/AD/AD2_Category_03.jpg); width: 250px; height: 34px; padding-top: 0px;">
                            <div>
                                <strong>
                                            <span style="font-size: 18px; color: #ed1442;">

                                            </span>
                                </strong>
                                <strong>
                                            <span style="font-size: 18px; color: #b3b8c3">

                                            </span>
                                </strong>
                            </div>
                        </div>
                        <div style="background-image: url(../resources/images/AD/AD2_Category_04.jpg); width: 250px; height: 42px">
                            <div>
                                <strong>
                                            <span style="font-size: 24px; color: #1f2022">
                                                15,000원
                                            </span>
                                </strong>
                            </div>
                        </div>
                        <div style="background-image: url('../resources/images/AD/AD2_Category_05.jpg'); width: 250px; height: 75px; margin-right: 0px;">
                            <div style="padding-top: 3px;">
                                <a id="ContentPlaceHolder1_WUC_ADMain_lbtnGCategorySelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnGCategorySelect&#39;,&#39;&#39;)" style="display:inline-block;height:46px;width:185px;">선택</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="display: inline-block;">
                    <div style="width: 250px;">
                        <div style="background-image: url(../resources/images/AD/AD2_Static_01.jpg); width: 250px; height: 50px;">
                            <div style="padding-top: 15px;">
                                <strong>
                                    <span style="font-size: 18px; text-align: center;">오늘 + </span>
                                </strong>
                                        <span style="font-size: 18px; text-align: center;">
                                            <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGBannerDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGBannerDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlGBannerDays">
                                                <option selected="selected" value="3">3</option>
                                                <option value="7">7</option>
                                                <option value="14$10">14</option>
                                                <option value="21$14">21</option>
                                                <option value="28$19">28</option>

                                            </select>
                                        </span>
                                <strong>
                                            <span style="font-size: 18px; text-align: center;">&nbsp;일
                                            </span>
                                </strong>
                            </div>
                        </div>
                        <img src="../resources/images/AD/AD2_Static_02.jpg" width="250" height="24" border="0" />
                        <div style="background-image: url(../resources/images/AD/AD2_Static_03.jpg); width: 250px; height: 34px; padding-top: 0px;">
                            <div>
                                <strong>
                                            <span style="font-size: 18px; color: #ed1442;">

                                            </span>
                                </strong>
                                <strong>
                                            <span style="font-size: 18px; color: #b3b8c3">

                                            </span>
                                </strong>
                            </div>
                        </div>
                        <div style="background-image: url(../resources/images/AD/AD2_Static_04.jpg); width: 250px; height: 42px">
                            <div>
                                <strong>
                                            <span style="font-size: 24px; color: #1f2022">
                                                14,000원
                                            </span>
                                </strong>
                            </div>
                        </div>
                        <div style="background-image: url('../resources/images/AD/AD2_Static_05.jpg'); width: 250px; height: 75px; margin-right: 0px;">
                            <div style="padding-top: 3px;">
                                <a id="ContentPlaceHolder1_WUC_ADMain_lbtnGBannerSelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnGBannerSelect&#39;,&#39;&#39;)" style="display:inline-block;height:46px;width:185px;">선택</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="display: inline-block;">
                    <div style="width: 252px;">
                        <div style="background-image: url(../resources/images/AD/AD2_Nominate_01.jpg); width: 252px; height: 50px;">
                            <div style="padding-top: 15px;">
                                <strong>
                                    <span style="font-size: 18px; text-align: center;">오늘 + </span>
                                </strong>
                                        <span style="font-size: 18px; text-align: center;">
                                            <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGRecommandDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlGRecommandDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlGRecommandDays">
                                                <option selected="selected" value="3">3</option>
                                                <option value="7$5">7</option>
                                                <option value="14$10">14</option>

                                            </select>
                                        </span>
                                <strong>
                                            <span style="font-size: 18px; text-align: center;">&nbsp;일
                                            </span>
                                </strong>
                            </div>
                        </div>
                        <img src="../resources/images/AD/AD2_Nominate_02.jpg" width="252" height="24" border="0" />
                        <div style="background-image: url(../resources/images/AD/AD2_Nominate_03.jpg); width: 252px; height: 34px; padding-top: 0px;">
                            <strong>
                                        <span style="font-size: 18px; color: #ed1442;">

                                        </span>
                            </strong>
                            <strong>
                                        <span style="font-size: 18px; color: #b3b8c3">

                                        </span>
                            </strong>
                        </div>
                        <div style="background-image: url(../resources/images/AD/AD2_Nominate_04.jpg); width: 252px; height: 42px;">
                            <strong>
                                        <span style="font-size: 24px; color: #1f2022">
                                            25,000원
                                        </span>
                            </strong>
                        </div>
                        <div style="background-image: url('../resources/images/AD/AD2_Nominate_05.jpg'); width: 252px; height: 75px; margin-right: 0px;">
                            <div style="padding-top: 3px;">
                                <a id="ContentPlaceHolder1_WUC_ADMain_lbtnGRecommandSelect" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnGRecommandSelect&#39;,&#39;&#39;)" style="display:inline-block;height:46px;width:185px;">선택</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 중간배너스타일 시작 -->

    <!-- 결제 -->
    <div id="ContentPlaceHolder1_WUC_ADMain_paying" style="background-color: #e1e1e1; display: none;">
        <div>
            <ul>
                <li style="display: inline-block;">
                    <img id="ContentPlaceHolder1_WUC_ADMain_imgADType" Border="0" src="../resources/images/AD/AD3_Nominate_Screen1.jpg" style="height:338px;width:260px;" />
                </li>
                <li style="display: inline-block;">
                    <div style="width: 742px;">
                        <img src="../resources/images/AD/AD3_Nominate_Screen02.jpg" width="742" height="36" border="0" />
                    </div>
                    <div>
                        <div style="display: inline-block; vertical-align: top;">
                            <img src="../resources/images/AD/AD3_Nominate_Screen03.jpg" width="95" height="40" border="0" />
                        </div>
                        <div style="display: inline-block; background-image: url(../resources/images/AD/AD3_Nominate_Screen04.jpg); width: 290px; height: 40px; border: 0; vertical-align: top;">
                            <div style="text-align: left; padding: 0; padding-top: 8px;">
                                <strong>
                                    <span style="font-size: 18px; text-align: center;">오늘 + </span>
                                </strong>
                                        <span style="font-size: 18px; text-align: center;">
                                            <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlDays" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlDays\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlDays">

                                            </select>
                                        </span><strong><span style="font-size: 18px; text-align: center;">&nbsp;일
                                        </span>
                            </strong>
                            </div>
                        </div>
                        <div style="display: inline-block; vertical-align: top;">
                            <img src="../resources/images/AD/AD3_Nominate_Screen05.jpg" width="105" height="40" border="0" />
                        </div>
                        <div style="display: inline-block; background-image: url(../resources/images/AD/AD3_Nominate_Screen06.jpg); width: 252px; height: 40px; border: 0; vertical-align: top;">
                            <div style="padding-top: 8px; padding-right: 30px; text-align: right;">
                                <strong>
                                            <span style="font-size: 18px; color: #ed1442;">

                                            </span>
                                </strong>
                                <strong>
                                            <span style="font-size: 18px; color: #b3b8c3">
                                                <span id="ContentPlaceHolder1_WUC_ADMain_lbPaymentBefore" style="text-decoration: line-through;"></span>
                                            </span>
                                </strong>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div style="display: inline-block; vertical-align: top;">
                            <img src="../resources/images/AD/AD3_Nominate_Screen07.jpg" width="95" height="50" border="0" />
                        </div>
                        <div style="display: inline-block; background-image: url(../resources/images/AD/AD3_Nominate_Screen08.jpg); width: 290px; height: 50px; vertical-align: top;">
                            <div style="padding-top: 12px; text-align: left;">
                                        <span style="font-size: 18px; text-align: center;">
                                            <select name="ctl00$ContentPlaceHolder1$WUC_ADMain$ddlAbility" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$ddlAbility\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_ADMain_ddlAbility" style="width:260px;">

                                            </select>
                                        </span>
                            </div>
                        </div>
                        <div style="display: inline-block; vertical-align: top;">
                            <img src="../resources/images/AD/AD3_Nominate_Screen09.jpg" width="105" height="50" border="0" />
                        </div>
                        <div style="display: inline-block; background-image: url(../resources/images/AD/AD3_Nominate_Screen06.jpg); width: 252px; height: 50px; vertical-align: top;">
                            <div style="padding-top: 12px; padding-right: 30px; text-align: right;">
                                <strong>
                                            <span style="font-size: 18px; color: #b3b8c3">

                                            </span>
                                </strong>
                            </div>
                        </div>
                    </div>
                    <div>
                        <img src="../resources/images/AD/AD3_Nominate_Screen11.jpg" width="742" height="40" border="0" />
                    </div>
                    <div style="background-image: url(../resources/images/AD/AD3_Nominate_Screen12.jpg); width: 742px; height: 50px;">
                        <strong>
                                    <span style="font-size: 20px; color: #ed1442">지금 신청하시면 해당 광고는
                                    </span>
                                    <span style="font-size: 20px; color: #1f2022">[
                                    2014년 10월 10일]
                                    </span>
                                    <span style="font-size: 20px; color: #ed1442">부터 게제됩니다.<br />
                                        광고 신청을 하시겠습니까?
                                    </span>
                        </strong>
                    </div>
                    <div>
                        <img src="../resources/images/AD/AD3_Nominate_Screen13.jpg" width="742" height="35" border="0" />
                    </div>
                    <div>
                        <div style="background-image: url('../resources/images/AD/AD3_Nominate_Screen14.jpg'); width: 742px; height: 70px; margin-right: 0px;">
                            <div style="padding-right: 50px; padding-top: 5px;">
                                <a onclick="if(!confirm(&#39;선택 하신 정보가 문제가 없으시면 결제를 진행하겠습니다.&#39;)) return false;" id="ContentPlaceHolder1_WUC_ADMain_lbtnPayment" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_ADMain$lbtnPayment&#39;,&#39;&#39;)" style="display:inline-block;height:60px;width:250px;">결제하기</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <img src="../resources/images/AD/AD3_Nominate_Screen15.jpg" width="742" height="17" border="0" />
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 결제 -->
</div>

<br />

</body>
</html>
