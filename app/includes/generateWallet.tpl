<main class="tab-pane active text-center" ng-if="globalService.currentTab==globalService.tabs.generateWallet.id" ng-controller='walletGenCtrl' role="main">

  <section class="row" ng-show="!wallet && !showGetAddress">
    <h1 aria-live="polite"> Create New TSF Account</h1>
    <div class="col-sm-8 col-sm-offset-2 poz">
      <h4 translate="GEN_Label_1"> Enter password </h4>
      <div class="input-group">
        <input name="password"
               class="form-control"
               type="{{showPass && 'password' || 'text'}}"
               placeholder=""
               ng-model="password"
               ng-class="isStrongPass() ? 'is-valid' : 'is-invalid'"
               aria-label="{{ 'GEN_Label_1' |translate}}"/>
        <span tabindex="0" aria-label="make password visible" role="button" class="input-group-addon eye" ng-click="showPass=!showPass"></span>
      </div>
      <br />
      <a tabindex="0" role="button" class="btn btn-primary btn-block" func="generateSingleWallet" ng-click="genNewWallet()">CREATE ACCOUNT</a>
      <br /><br /><br /><br /><br /><br />
    </div>
  </section>


  <section role="main" class="row" ng-show="wallet && !showPaperWallet">
    <h1 translate="GEN_Label_2">Save your Wallet File. Don't forget your password.</h1>
    <br>
    <div class="col-sm-8 col-sm-offset-2">
      <div aria-hidden="true" class="account-help-icon">
        <h4 translate="x_Keystore2">Keystore File (Recommended • Encrypted)</h4>
      </div>
      <a tabindex="0" role="button" class="btn btn-primary btn-block" href="{{blobEnc}}" download="{{encFileName}}" translate="x_Download" aria-label="{{'x_Download'|translate}} {{'x_Keystore'|translate}}" aria-describedby="x_KeystoreDesc" ng-click="downloaded()"> DOWNLOAD </a>
      <p class="sr-only" id="x_KeystoreDesc" translate="x_KeystoreDesc"></p>
      <br><br><br><br>
    </div>
    <div class="col-xs-12 alert alert-danger">
      <span>
       Download and save your wallet file now & back it up. <br />
      <strong>If you do not save your wallet file and password, we cannot recover them.</strong><br />
     
      <br /><br />
      <a tabindex="0" role="button" class="btn btn-info" ng-class="fileDownloaded ? '' : 'disabled' " ng-click="continueToPaper()"> I understand. Continue. </a></span>
    </div>
  </section>


  <section class="row" ng-show="showPaperWallet">
    <h1 translate="GEN_Label_4"> Print your paper wallet, or store a QR code version. </h1>
    <h4> If you think you may <u>ever</u> forget your password, save one of these, please! Keep it safe!</h4>
    <div class="col-sm-8 col-sm-offset-2">
      <div aria-hidden="true" class="account-help-icon">
        <label translate="x_PrivKey">Private Key (unencrypted)</label>
      </div>
      <textarea aria-label="{{'x_PrivKey'|translate}}" aria-describedby="x_PrivKeyDesc" class="form-control bigger-on-mobile" type="text" readonly="readonly">{{wallet.getPrivateKeyString()}}</textarea>
      <div aria-hidden="true" class="account-help-icon">
        <label translate="x_Print">Print Paper Wallet:</label>
      </div>
      <a tabindex="0" aria-label="{{'x_Print'|translate}}" aria-describedby="x_PrintDesc" role="button" class="btn btn-primary btn-block" ng-click="printQRCode()" translate="x_PrintShort">PRINT</a>
    </div>
    <br /><br />
    <div class="col-sm-4 col-sm-offset-4">
      <label translate="x_PrivKey">Private Key (unencrypted):</label>
      <div qr-code="{{wallet.getPrivateKeyString()}}" watch-var="showPaperWallet" width="100%"></div>
      <br />
      <br />
      <a class="btn btn-info" ng-click="getAddress()"> Next: Save your Address </a>
    </div>
  </section>

  <article class="row text-left" ng-show="showGetAddress">
    <section class="clearfix collapse-container">
      <div class="text-center" ng-click="wd = !wd">
        <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a>
        <h1 traslate="SWAP_unlock">Unlock your wallet to see your address</h1>
      </div>
      <div ng-show="!wd">
          @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
          @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
      </div>
    </section>

    <section class="clearfix" ng-show="wallet!=null" ng-controller='viewWalletCtrl'>

      @@if (site === 'cx' ) {  @@include( './viewWalletInfo-content.tpl', { "site": "cx" } )    }
      @@if (site === 'mew') {  @@include( './viewWalletInfo-content.tpl', { "site": "mew" } )   }

    </section>
  </article>

</main>
