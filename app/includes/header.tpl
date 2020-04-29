<!DOCTYPE html>
<html lang="en" ng-app="mewApp">
<head>
  <meta charset="utf-8">
  <title>TeslaFunds Web Wallet</title>
  <link rel="canonical" href="https://teslafunds.io" />
  <meta name="description" content="Teslafunds webwallet">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/etherwallet-master.min.css">
  <script type="text/javascript" src="js/etherwallet-static.min.js"></script>
  <script type="text/javascript" src="js/etherwallet-master.js"></script>
<!--
  <link rel="apple-touch-icon" sizes="180x180" href="images/fav/apple-touch-icon.png">
  <link rel="icon" type="image/png" href="images/fav/favicon-32x32.png" sizes="32x32">
  <link rel="icon" type="image/png" href="images/fav/favicon-16x16.png" sizes="16x16">
  <link rel="manifest" href="images/fav/manifest.json">
  <link rel="mask-icon" href="images/fav/safari-pinned-tab.svg" color="#0e97c0">-->
  <link rel="shortcut icon" href="images/fav/tsf.ico">
  <meta name="msapplication-config" content="images/fav/browserconfig.xml">
  <meta name="theme-color" content="#163151">

  <meta property="og:url"         content="https://wallet.teslafunds.io" />
  <meta property="og:title"       content="Teslafunds webwallet" />
  <meta property="og:description" content="Teslafunds webwallet" />
  <meta property="og:image"       content="images/fb-myetherwallet.png" />
  <meta property="og:image"       content="images/fb-mewtwo.jpg" />
</head>

<body>

<header class="{{curNode.name}} {{curNode.service}}" aria-label="header" ng-controller='tabsCtrl' >
 
  <section class="bg-gradient header-branding" style=" background-image: url(images/foot.jpg); padding-bottom: 50px; padding-top: 50px;">
    <section class="container">

      @@if (site === 'mew' ) { <a class="brand" href="https://wallet.teslafunds.io/" aria-label="Go to homepage"> <img src="images/logo2.png"   height="64px" width="350px" alt="TSF" /></a> }
      @@if (site === 'cx'  ) { <a class="brand" href="/cx-wallet.html" aria-label="Go to homepage">                <img src="images/logo2.png" height="64px" width="350px" alt="TSF" /></a> }

      <div class="tagline">
        

        &nbsp;&nbsp;

        <span class="dropdown dropdown-gas" ng-cloak>
          <a tabindex="0" aria-haspopup="true" aria-label="adjust gas price" class="dropdown-toggle  btn btn-white" ng-click="dropdownGasPrice = !dropdownGasPrice">
            <span translate="OFFLINE_Step2_Label_3">Gas Price</span>:
              {{gas.value}} Gwei
              <i class="caret"></i>
          </a>
          <ul class="dropdown-menu" ng-show="dropdownGasPrice">
            <div class="header--gas" style="color: #000;">
              <span translate="OFFLINE_Step2_Label_3">Gas Price</span>:
              {{gas.value}} Gwei
              <input type="range" ng-model="gas.value" min="{{gas.min}}" max="{{gas.max}}" step="{{gas.step}}" ng-change="gasChanged()"/>
              <p class="small col-xs-4 text-left"> <!--translate="GAS_Price_1"-->
                Slow
              </p>
              <p class="small col-xs-4 text-center"> <!--translate="GAS_Price_2"-->
                Medium
              </p>
              <p class="small col-xs-4 text-right"> <!--translate="GAS_Price_3"-->
                Fast
              </p>
              <br />
              <!-- <p class="small" style="white-space:normal;font-weight:300;margin: 2rem 0 0;" translate="GAS_PRICE_Desc"></p> -->
             
            </div>
          </ul>
        </span>
        <span class="dropdown dropdown-node" ng-cloak>
          <a tabindex="0" aria-haspopup="true" aria-label="change node. current node {{curNode.name}} node by {{curNode.service}}" class="dropdown-toggle" ng-click="dropdownNode = !dropdownNode"> {{curNode.name}} <small>({{curNode.service}})</small><i class="caret"></i></a>
          <ul class="dropdown-menu" ng-show="dropdownNode">
            <li ng-repeat="(key, value) in nodeList"><a ng-class="{true:'active'}[curNode == key]" ng-click="changeNode(key)">
              {{value.name}}
              <small> ({{value.service}}) </small>
              <img ng-show="value.service=='Custom'" img src="images/icon-remove.svg" class="node-remove" title="Remove Custom Node" ng-click="removeNodeFromLocal(value.name)"/>
            </a></li>
            <li><a ng-click="customNodeModal.open(); dropdownNode = !dropdownNode;"> Add Custom Node </a></li>
          </ul>
        </span>

      </div>
    </section>
  </section>

  <!-- <section class="bg-gradient header-branding">
    <section class="container">

      @@if (site === 'mew' ) { <a class="brand" href="https://pyrus.ubiqsmart.com/" aria-label="Go to homepage"> <img src="images/logo-pyrus-2.svg"   height="16px" width="160px" alt="Pyrus" /></a> }
      @@if (site === 'cx'  ) { <a class="brand" href="/cx-wallet.html" aria-label="Go to homepage">                <img src="images/logo-pyrus.svg" height="64px" width="245px" alt="Pyrus" /></a> }

      <div class="tagline"><span style="max-width: 395px">Pyrus - Open-Source & Client-Side Ubiq Wallet</span>

        &middot; v3.7.4 &nbsp;&nbsp;

        <span class="dropdown" ng-cloak>
          <a tabindex="0"  aria-haspopup="true" aria-expanded="false" aria-label="change language. current language {{curLang}}" class="dropdown-toggle" ng-click="dropdown = !dropdown">{{curLang}}<i class="caret"></i></a>
          <ul class="dropdown-menu" ng-show="dropdown">
            <li><a ng-class="{true:'active'}[curLang=='English']"      ng-click="changeLanguage('en','English'     )"> English         </a></li>
            <li role="separator" class="divider"></li>
            <li><a data-toggle="modal" data-target="#disclaimerModal" translate="FOOTER_4"> Disclaimer </a></li>
          </ul>
        </span>

        &nbsp;&nbsp;

        <span class="dropdown dropdown-node" ng-cloak>
          <a tabindex="0" aria-haspopup="true" aria-label="change node. current node {{curNode.name}} node by {{curNode.service}}" class="dropdown-toggle" ng-click="dropdownNode = !dropdownNode"> {{curNode.name}} <small>({{curNode.service}})</small><i class="caret"></i></a>
          <ul class="dropdown-menu" ng-show="dropdownNode">
            <li ng-repeat="(key, value) in nodeList"><a ng-class="{true:'active'}[curNode == key]" ng-click="changeNode(key)">
              {{value.name}}
              <small> ({{value.service}}) </small>
              <img ng-show="value.service=='Custom'" img src="images/icon-remove.svg" class="node-remove" title="Remove Custom Node" ng-click="removeNodeFromLocal(value.name)"/>
            </a></li>
            <li><a ng-click="customNodeModal.open(); dropdownNode = !dropdownNode;"> Add Custom Node </a></li>
          </ul>
        </span>

      </div>
    </section>
  </section> -->

  <nav role="navigation" aria-label="main navigation" class="container nav-container overflowing" >
    <a aria-hidden="true" ng-show="showLeftArrow" class="nav-arrow-left" ng-click="scrollLeft(100);" ng-mouseover="scrollHoverIn(true,2);" ng-mouseleave="scrollHoverOut()">&#171;</a>
    <div class="nav-scroll">
      <ul class="nav-inner">
        @@if (site === 'mew' ) {
        <li ng-repeat="tab in tabNames track by $index" class="nav-item {{tab.name}}" ng-class="{active: $index==gService.currentTab}" ng-show="{{tab.mew}}" ng-click="tabClick($index)"> <a tabindex="0" aria-label="nav item: {{tab.name | translate}}" translate="{{tab.name}}"></a></li>
        }
        @@if (site === 'cx' ) {
        <li ng-repeat="tab in tabNames track by $index" class="nav-item {{tab.name}}" ng-class="{active: $index==gService.currentTab}" ng-show="{{tab.cx}}" ng-click="tabClick($index)"> <a tabindex="0" aria-label="nav item: {{tab.name | translate}}" translate="{{tab.name}}"></a></li>
        }
      </ul>
    </div>
    <a aria-hidden="true" ng-show="showRightArrow" class="nav-arrow-right hidden" ng-click="scrollRight(100);" ng-mouseover="scrollHoverIn(false,2);" ng-mouseleave="scrollHoverOut()">&#187;</a>
  </nav>

  @@if (site === 'mew' ) { @@include( './header-node-modal.tpl', { "site": "mew" } ) }
  @@if (site === 'cx'  ) { @@include( './header-node-modal.tpl', { "site": "cx"  } ) }

</header>
