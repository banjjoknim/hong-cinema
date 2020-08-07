<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/simplex.css" rel="stylesheet">
    <style>
        div.seatRow {
            position: relative;
        }

        div.seatRow button {
            cursor: pointer;
            background-color: lightgray;
            position: absolute;
            padding: 2px;
            width: 25px;
            height: 25px;
        }

        div.seatRow button:hover {
            background-color: crimson;
        }

        button {
            cursor: pointer;
        }

        div.seatRow button.represent {
            background-color: lightgray;
        }

        li.theaterInfo {
            margin-bottom: 10px;
        }

        button.selectedSeat {
            margin: 5px;
            float: left;
            width: 50px;
            height: 50px;
        }

        /* row button start */
        button.row-A {
            top: 120px;
        }

        button.row-B {
            top: 150px;
        }

        button.row-C {
            top: 180px;
        }

        button.row-D {
            top: 210px;
        }

        button.row-E {
            top: 240px;
        }

        button.row-F {
            top: 270px;
        }

        button.row-G {
            top: 300px;
        }

        button.row-H {
            top: 330px;
        }

        button.row-I {
            top: 360px;
        }

        button.row-J {
            top: 390px;
        }

        button.row-K {
            top: 420px;
        }

        button.row-L {
            top: 450px;
        }

        /* col button start */
        button.col-1 {
            left: 120px;
        }

        button.col-2 {
            left: 150px;
        }

        button.col-3 {
            left: 160px;
        }

        button.col-4 {
            left: 190px;
        }

        button.col-5 {
            left: 220px;
        }

        button.col-6 {
            left: 250px;
        }

        button.col-7 {
            left: 280px;
        }

        button.col-8 {
            left: 310px;
        }

        button.col-9 {
            left: 340px;
        }

        button.col-10 {
            left: 370px;
        }

        button.col-11 {
            left: 400px;
        }

        button.col-12 {
            left: 430px;
        }

        button.col-13 {
            left: 460px;
        }

        button.col-14 {
            left: 490px;
        }

        button.col-15 {
            left: 520px;
        }

        button.col-16 {
            left: 550px;
        }

        button.col-17 {
            left: 580px;
        }

        .movieInfo {
            color: white;
        }

        button.decisionBtn:hover {
            color: coral;
        }

        body {
            margin-bottom: 500px;
        }

        div.selectType button {
            outline: none;
            cursor: pointer;
            border: solid 1px gray;
        }
    </style>
</head>

<body>
    <!-- navbar start -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <!-- navbar end -->
    <header>
        <div class="selectType"
            style="width: 900px; height: 45px; margin: 7px auto; font-size: 130%; padding: 0 20px; border-bottom: 1px solid gray;">
            <h1 style="text-align: left;">좌석선택</h1>
        </div>
    </header>

    <!-- selectType start -->
    <div class="selectType" style="width: 900px; height: 45px; margin: 7px auto; font-size: 130%; padding: 0 50px;">
        <div style="float: left; padding: 10px 5px; margin-right: 20px;">
            <span style="float: left; margin-right: 10px;">성인</span>
            <button type="button" style="float: left; height: 25px; width: 25px;">-</button>
            <div style="float: left; width: 30px; height: 30px; text-align: center;">0</div>
            <button type="button" style="float: left; height: 25px; width: 25px;">+</button>
        </div>
        <div style="float: left; padding: 10px 5px; margin-right: 20px;">
            <span style="float: left; margin-right: 10px;">청소년</span>
            <button type="button" style="float: left; height: 25px; width: 25px;">-</button>
            <div style="float: left; width: 30px; height: 30px; text-align: center;">0</div>
            <button type="button" style="float: left; height: 25px; width: 25px;">+</button>
        </div>
        <!-- <div style="float: left; padding: 10px 5px;">
            <span style="float: left; margin-right: 10px;">어린이</span>
            <button type="button" style="float: left; height: 25px; width: 25px;">-</button>
            <div style="float: left; width: 30px; height: 30px; text-align: center;">0</div>
            <button type="button" style="float: left; height: 25px; width: 25px;">+</button>
        </div> -->
        <div style="float: left; padding: 10px 5px; margin-right: 20px;">
            <span style="float: left; margin-right: 10px;">우대</span>
            <button type="button" style="float: left; height: 25px; width: 25px;">-</button>
            <div style="float: left; width: 30px; height: 30px; text-align: center;">0</div>
            <button type="button" style="float: left; height: 25px; width: 25px;">+</button>
        </div>
    </div>
    <!-- selectType end -->

    <!-- reservationBox -->
    <div class="reservationBox" style="margin: 0 auto; width: 900px; height: 555px;">




        <div class="seatRow"
            style="padding: 0 100px; width: 560px; height: 555px; background-color: rgb(80, 80, 80); float: left;">

            <h3 style="margin-left: 150px; color: white; margin-top: 30px;">SCREEN</h3>

            <!-- row A start -->

            <button type="button" class="row-A represent" style="border: 2px solid black; left: 20px;">A</button>
            <button type="button" class="row-A col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-A col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-A col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-A col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-A col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-A col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-A col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-A col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-A col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-A col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-A col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-A col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row A end -->

            <!-- row B start -->

            <button type="button" class="row-B represent" style=" border: 2px solid black; left: 20px;">B</button>
            <button type="button" class="row-B col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-B col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-B col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-B col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-B col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-B col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-B col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-B col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-B col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-B col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-B col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-B col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-B col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-B col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-B col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-B col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-B col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row B end -->

            <!-- row C start -->

            <button type="button" class="row-C represent" style=" border: 2px solid black; left: 20px;">C</button>
            <button type="button" class="row-C col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-C col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-C col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-C col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-C col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-C col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-C col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-C col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-C col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-C col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-C col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-C col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row C end -->

            <!-- row D start -->

            <button type="button" class="row-D represent" style=" border: 2px solid black; left: 20px;">D</button>
            <button type="button" class="row-D col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-D col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-D col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-D col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-D col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-D col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-D col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-D col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-D col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-D col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-D col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-D col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row D end -->

            <!-- row E start -->

            <button type="button" class="row-E represent" style=" border: 2px solid black; left: 20px;">E</button>
            <button type="button" class="row-E col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-E col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-E col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-E col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-E col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-E col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-E col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-E col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-E col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-E col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-E col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-E col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row E end -->

            <!-- row F start -->

            <!-- <button type="button" class="row-F represent" style=" border: 2px solid black; left: 20px;">F</button>
            <button type="button" class="row-F col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-F col-2" style=" border: 2px solid black;">2</button> -->
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <!-- <button type="button" class="row-F col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-F col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-F col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-F col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-F col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-F col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-F col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-F col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-F col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-F col-14" style=" border: 2px solid black;">14</button> -->
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row F end -->

            <!-- row G start -->

            <!-- <button type="button" class="row-G represent" style=" border: 2px solid black; left: 20px;">G</button>
            <button type="button" class="row-G col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-G col-2" style=" border: 2px solid black;">2</button> -->
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <!-- <button type="button" class="row-G col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-G col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-G col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-G col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-G col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-G col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-G col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-G col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-G col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-G col-14" style=" border: 2px solid black;">14</button> -->
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row G end -->

            <!-- row H start -->

            <button type="button" class="row-H represent" style=" border: 2px solid black; left: 20px;">H</button>
            <button type="button" class="row-H col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-H col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-H col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-H col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-H col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-H col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-H col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-H col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-H col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-H col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-H col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-H col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row H end -->

            <!-- row I start -->

            <button type="button" class="row-I represent" style=" border: 2px solid black; left: 20px;">I</button>
            <button type="button" class="row-I col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-I col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-I col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-I col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-I col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-I col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-I col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-I col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-I col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-I col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-I col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-I col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row I end -->

            <!-- row J start -->

            <button type="button" class="row-J represent" style=" border: 2px solid black; left: 20px;">J</button>
            <button type="button" class="row-J col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-J col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-J col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-J col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-J col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-J col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-J col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-J col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-J col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-J col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-J col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-J col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row J end -->

            <!-- row K start -->

            <button type="button" class="row-K represent" style=" border: 2px solid black; left: 20px;">K</button>
            <button type="button" class="row-K col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-K col-2" style=" border: 2px solid black;">2</button>
            <!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
            <button type="button" class="row-K col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-K col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-K col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-K col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-K col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-K col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-K col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-K col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-K col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-K col-14" style=" border: 2px solid black;">14</button>
            <!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

            <!-- row K end -->

        </div>

        <div class="infoBox"
            style="background-color: rgb(51, 51, 51); width: 328px; height: 555px; float: left; margin-left: 10px; padding-top:30px;">
            <div class="movieInfo">

                <div style="margin: 5px; padding: 0 30px; margin-bottom: 10px;">
                    <div style="width: 250px; border-bottom: 1px solid darkgrey;">
                    <h3>${schedule.selectedMovie }</h3>
                </div>
                </div>

                <div style="float: left; width: 328px; padding: 0 30px; margin-top: 10px;">
                    <div style="width: 250px; height: 140px; border-bottom: 1px solid darkgrey; margin-left: 6px;">
                    <ul
                        style="list-style: none; float: left; margin-right: 15px; margin-left: 10px; padding: 10px 20px;">
                        <li class="theaterInfo">가산시네마</li>
                        <li class="theaterInfo">${schedule.selectedTheaterNumber } 관</li>
                        <li class="theaterInfo">${schedule.selectedDate }</li>
                        <li class="theaterInfo">상영시간</li>
                    </ul>
                    <img src="https://via.placeholder.com/90x120.png" width="90px" height="120px"
                        style="margin-bottom: 0px; float: left;">
                    </div>
                </div>

                <div>
                    
                        <h3 style="margin-left: 35px;">선택좌석</h3>
                    <div style="width: 250px; height: 120px; margin: 0 auto; border-bottom: 1px solid darkgrey; padding: 0 10px;">
                    <ul
                        style="list-style: none; padding: 0px 15px;">
                        <li style="margin: 0 auto;"><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">A13</button>
                        </li>
                        <li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">A7</button>
                        </li>
                        <li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">B10</button>
                        </li>
                        <li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">B8</button>
                        </li>
                        <li><button class="selectedSeat"
                                style="width: 40px; height: 40px; clear: both; border: none;">F8</button></li>
                        <li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">F12</button>
                        </li>
                        <li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">F8</button>
                        </li>
                        <li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;">F12</button>
                        </li>
                        <!-- <li class="selectedSeat">좌석1</li>
                        <li class="selectedSeat">좌석2</li>
                        <li class="selectedSeat">좌석3</li>
                        <li class="selectedSeat">좌석4</li> -->
                    </ul>
                    </div>
                </div>
                <div>
                    <div style="float: left; margin-top: 25px; padding: 0 30px;">성인 n명 청소년 n명</div>
                    <div style="clear: both; padding: 0 30px; margin-top: 20px; font-size: 140%;">최종 결제금액 <span
                            style="float: right;">원</span>
                        <span style="float: right; color: cadetblue; font-size: 120%;">50000</span>
                    </div>
                </div>
                <div class="buttonBox" style="text-align: center; clear: both; margin-top: 25px;">
                    <button type="button" class="decisionBtn"
                        style="width: 164px; height: 55px; float: left; z-index: 999; background-color: #029ACF; outline: none; border: none; color: white; font-size: 150%;">결제</button>
                    <button type="button"
                        style="width: 164px; height: 55px; float: left; z-index: 999; background-color: rgb(120, 120, 120); outline: none; border: none; color: white; font-size: 150%;">취소</button>
                </div>
            </div>

        </div>

    </div>
    <!-- reservationBox end -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
    <script>
    $(document).ready(function(){
    console.log(1);
    	
    })
    </script>
    
    
    
    
</body>

</html>