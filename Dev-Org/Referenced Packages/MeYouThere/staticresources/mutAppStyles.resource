    /*
        <apex:stylesheet value="https://www.dropbox.com/s/maczge1wpwxa1vf/mut.css?dl=1"/>
        mut.css styles should go here, as this css is crafted in dropbox, but pasted here for performance reasons.
    */
    /* Angular styles */
    
    [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
         display: none !important;
    }
     
    /* Angular styles end */
    
    a.icon:hover{
        text-decoration: none !important;
    }
    
    .activeMenuItem {
        font-weight: bold;
        border-bottom: 1px solid;
    }
    
    pre code { background: transparent; }
            
    span.iChildSep i {
        margin-left: 30px !important;
    }
    header.mutHeader, header.placeDetailHeader{
        background-color: white;
        border-bottom: 1px solid #dfe0e1;
        overflow: hidden;
        margin-bottom:15px;
       
    }
    .days.Sat{
        border-top:1px dashed #ccc;
    }
    .days.Sun{
        border-bottom:1px dashed #ccc;
    }
    .days.Sat .title h4,  .days.Sun .title h4{
        color : #DF444A;
        
    }
    .placeDetailHeader{
        padding-bottom:10px;
    }
    .moreOptions{
        font-size: 10px;
        color:#ccc;
        text-align:right;
        padding-top:5px;
    }
    .dropdown a{
        color:#525354;
    }
    .card.past{
        opacity:0.6;
    }
    
    header .hilight{
        background-color: #E8EFF9;
        padding:3px 5px;
    }
    .list-group.filterOptions{
    margin-bottom: 0px;
    border-top: 1px solid #cfd0d2;
    
    }
    .card .card-heading{
        padding-bottom: 0px;
    }
    .card-footer{
        margin-top:10px;
       
    }
    .card-list{
        background-color: white;
    }
    .nomeeting{
        background-color: #e8e9ec;
       
    }
    h4.weekend{
        color:#999;
    }
    .nomeeting p{
        padding: 10px;
        color:#999;
    }
    
    .footerlinks{
        border-top:1px dotted #dfe0e1;
        font-weight: bold;
        font-size: 11px;
        background-color: #f7f7f7;
        border-bottom-right-radius: 5px;
        border-bottom-left-radius: 5px;
    }
    .footerlinks a{
        color: #999;
    }

    .footerlinks > div{
        padding:10px 0px;
    }

    .meeting.card .card-detail {
        padding: 0 15px 0px;
    }
    .meeting.card .card-heading {
        padding: 5px 15px 0px;
        padding: 5px 15px 0px;
    }
    .content ul{
        margin-left: 0px;
        list-style: none;
        padding-left: 0px;
    }
    .mutHeader .s1icon{
        height: 30px;
    width: 30px;
    
    }
    .mutHeader .icon{
        padding-left:15px;
        padding-top:15px;
    }
    .bar .icon .btn{
        font-size: 14px;
    }

    .mutHeader .navicons{
        padding-right:5px;
        padding-top: 15px;
    }
    .navicons .btn-link{
        border-radius: 4px;
    
    }
    .navicons .btn-link.active{
        color:white;
        background-color: #2a94d6;
    }
    .mutHeader h1{
        margin:0px;
        margin-left:15px;
        padding-top: 14px;
        padding-bottom: 14px;
    
        display: inline-block;
    }
    .mutHeader h1 .subtitle{
        font-size: 13px;
        color: #ccc;
       display: block;
    }
    
    .mutHeader h1 .title{
        font-size: 16px;
         display: block;
         line-height: 2;
    }
    
    .iconColorOrange {
        color:orange;
    }
    
    .iconColorWhite {
        color:lightgrey;
    }
    
    .no-padding {
       padding:0px !important;
    }
    .row.no-gutter {
      margin-left: 0;
      margin-right: 0;
    }
    
    .row.no-gutter [class*='col-']:not(:first-child),
    .row.no-gutter [class*='col-']:not(:last-child) {
      padding-right: 0;
      padding-left: 0;
    }
    
    .dimmer {
      opacity: .4;
      -webkit-transition: opacity 0.15s linear;
      transition: opacity 0.15s linear;
    }
    
    .themeColorEvent {
        color : #eb7092 !important;
    }
       
    .bg-message p {						
    	padding: 10px 10px 10px;
    	margin: 0;
    }
    
    .header .list-group-item {
        background-color: white;
    
    }
    .filternav{
    }
    .list-group.fade{
        opacity: 0.4;
    }
    .filternav h2{
        line-height: 2;
    }
    .list-group.header{
        border-top:1px solid #cfd0d2;
    } 
    
    .filternavEvent a.filterlink {
        border-color : #eb7092 !important;
    }
    
    .filternavLetsMeet a.filterlink {
        border-color : #3cc2b3 !important;
    }
    
    .filternav a.filterlink {
        padding: 5px;
        border-bottom: 1px solid;
        margin: 5px;
        white-space: nowrap;
        color: #555555;
        cursor: pointer;
    }
    
    .filternav a:hover{
        text-decoration: none;
    }
    .filters a{
        background-color: white;
    }
    .filteroptions{
        text-align: right;
        padding:0 10px;
    }
    .filternav a i{
        font-size: 12px
    
    }
    
    .dropdown-menu {
        width: 100%;
    }
    
    .actionDetail li{
         display:inline;
         padding-right:42px;
    }
    
    /* S1 Spinner Styles */
        
    @-webkit-keyframes loading-rotate {
        0% {
            -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
        }
    
        100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
    
    @keyframes loading-rotate {
        0% {
            -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
            transform: rotate(0deg);
        }
    
        100% {
            -webkit-transform: rotate(360deg);
            -ms-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
            
            
    .forceModalSpinner .modal-glass {
        background-color:#000;
        opacity:0;
        position:absolute;
        top:0;
        right:0;
        bottom:0;
        left:0;
        display:block;
        z-index:999;
        margin-left:40px;
    }
    
    .forceModalSpinner .indicatorContainer {
        text-align:center;
        background:#354452;
        opacity:.9;
        border-radius:5px;
        width:110px;
        height:102px;
        padding-top:22px;
        color:#fff;
        top:50%;
        left:0;
        right:0;
        position:absolute;
        z-index:1000;
        display:block;
        margin:-65px auto;
    }
    
    .forceModalSpinner .indicatorContainer .icon.spinnerIcon {
        -webkit-animation:loading-rotate linear .8s infinite;
        animation:loading-rotate linear .8s infinite;
        -webkit-animation-fill-mode:forwards;
        animation-fill-mode:forwards;
        background:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2M3B4IiBoZWlnaHQ9IjYzcHgiIHZpZXdCb3g9IjAgMCA2MyA2MyI+PHBhdGggZmlsbD0iI0ZGRiIgZD0iTTMxLjUwMSwxNi43ODF2LTQuODg2Yy0xMC43ODksMC0xOS41MzYsOC43NDUtMTkuNTM2LDE5LjUzNWMwLDEwLjc4OSw4Ljc0NywxOS41MzUsMTkuNTM2LDE5LjUzNWMxMC43ODgsMCwxOS41MzQtOC43NDYsMTkuNTM0LTE5LjUzNWMwLTUuMjE0LTIuMDQ5LTkuOTQ4LTUuMzc3LTEzLjQ1Mmw0LjcxOS00LjQ4M2M0LjQ0LDQuNjcxLDcuMTY4LDEwLjk4Myw3LjE2OCwxNy45MzdjMCwxNC4zODUtMTEuNjYyLDI2LjA0My0yNi4wNDIsMjYuMDQzYy0xNC4zODYsMC0yNi4wNDctMTEuNjU4LTI2LjA0Ny0yNi4wNDNjMC0xNC4zODgsMTEuNjYxLTI2LjA0NywyNi4wNDctMjYuMDQ3VjAuNWw5Ljc2Nyw4LjEzOUwzMS41MDEsMTYuNzgxeiIvPjwvc3ZnPg==) no-repeat center center;
        background-size:100%;
    }
    
    
    .forceModalSpinner .indicatorContainer .icon {
        color:#fff;
        width:36px;
        height:36px;
    }
    
    .forceModalSpinner .indicatorContainer .message {
        font-family:ProximaNovaSoft-Medium;
        text-align:center;
        margin-top:14px;
        font-size:15px;
    }
    
    .oneCenterStage.indicator.forceInlineSpinner {
        position: absolute;
        right: 0;
        left: 0;
        top: 50%;
        z-index: 1001;
        margin-top: -15px;
    }
    
    .oneCenterStage.ALOHA {
        margin-left: 10px;
        margin-right: 10px;
    }
    
   
    
    .forceInlineSpinner.indicator {
        text-align: center;
        display: block;
    }
    
    
    .forceInlineSpinner .loading.large {
        width: 24px;
        height: 24px;
    }
    
    .forceInlineSpinner .loading.medium {
        width: 20px;
        height: 20px;
    }
    
    .forceInlineSpinner .loading.small {
        width: 16px;
        height: 16px;
    }
    
    
    .forceInlineSpinner .loading {
        width: 24px;
        height: 24px;
        color: #afb5b9;
        -webkit-animation: loading-rotate linear .8s infinite;
        animation: loading-rotate linear .8s infinite;
        -webkit-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
        background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2M3B4IiBoZWlnaHQ9IjYzcHgiIHZpZXdCb3g9IjAgMCA2MyA2MyI+PHBhdGggZmlsbD0iI2FmYjViOSIgZD0iTTMxLjUwMSwxNi43ODF2LTQuODg2Yy0xMC43ODksMC0xOS41MzYsOC43NDUtMTkuNTM2LDE5LjUzNWMwLDEwLjc4OSw4Ljc0NywxOS41MzUsMTkuNTM2LDE5LjUzNWMxMC43ODgsMCwxOS41MzQtOC43NDYsMTkuNTM0LTE5LjUzNWMwLTUuMjE0LTIuMDQ5LTkuOTQ4LTUuMzc3LTEzLjQ1Mmw0LjcxOS00LjQ4M2M0LjQ0LDQuNjcxLDcuMTY4LDEwLjk4Myw3LjE2OCwxNy45MzdjMCwxNC4zODUtMTEuNjYyLDI2LjA0My0yNi4wNDIsMjYuMDQzYy0xNC4zODYsMC0yNi4wNDctMTEuNjU4LTI2LjA0Ny0yNi4wNDNjMC0xNC4zODgsMTEuNjYxLTI2LjA0NywyNi4wNDctMjYuMDQ3VjAuNWw5Ljc2Nyw4LjEzOUwzMS41MDEsMTYuNzgxeiIvPjwvc3ZnPg==') no-repeat center center;
        background-size: 100%;
    }
    
    .forceModalSpinner .indicatorContainer .icon {
        color:#fff;
        width:36px;
        height:36px;
    }
    
    ul.centeredLi li {
        text-align: center;
    }
