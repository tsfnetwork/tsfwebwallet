<footer role="contentinfo" aria-label="footer" ng-controller='footerCtrl' >

  <div class="container">

    <section class="row"><section class="row" style="margin-top: 30px;">
 <div class="well well-round well-sm hidden">
            

        </div>
      <div class="col-sm-3 footer-1">
       <ul>
       <li><img src="images/putea.png" height="50px" width="auto" style="max-width: 12rem;" alt="putea" /></li>
        <li><p>Website :&nbsp;&nbsp;&nbsp;&nbsp; <a href='https://tsf-network.com' target='_blank'>https://tsf-network.com</a></p></li>
        
        <li><p>Office Address : &nbsp;&nbsp;Vudroa Vilsona 8</p></li>
        
        <li><p>11000 Belgrade &nbsp;&nbsp;&nbsp;&nbsp; </li>
        <li><p>Email :&nbsp;&nbsp;&nbsp;&nbsp; <a aria-label="contact" href="#" target="_blank">SRB@libertas-fund.com</a></p>
        </li>


      </ul>
        <br />
        <!-- <p><a role="link" tabindex="0" data-toggle="modal" data-target="#disclaimerModal" translate="FOOTER_4"> Disclaimer </a></p> -->
      </div>

      <div class="col-sm-6 footer-2">
       
      
     
        <ul>
        <li>TSF Explorer &nbsp;&nbsp;&nbsp;&nbsp;<a href='https://explorer.tsf-platform.com/#/' target='_blank'>https://explorer.tsf-platform.com/#/</a></li>
        
        <li>TSF Web Wallet &nbsp;&nbsp;&nbsp;&nbsp; <a href='https://putea.tsf-network.com' target='_blank'>https://putea.tsf-network.com</a></li>
        <li>TSF Pool &nbsp;&nbsp;&nbsp;&nbsp; <a href='http://tsfpool.xyz' target='_blank'>http://tsfpool.xyz</a></li>
       
        <li>Github &nbsp;&nbsp;&nbsp;&nbsp; <a href='https://github.com/tsfnetwork' target='_blank'>https://github.com/tsfnetwork</a></li>
        <li>Bitcointalk &nbsp;&nbsp;&nbsp;&nbsp; <a href='https://bitcointalk.org/index.php?topic=5080832' target='_blank'>https://bitcointalk.org/index.php?topic=5080832</a></li>
        <li>Telegram &nbsp;&nbsp;&nbsp;&nbsp; <a href='http://telegram.me/teslafunds' target='_blank'>http://telegram.me/teslafunds</a></li>
        </ul>
      </div>

      <div class="col-sm-3 footer-3">
        
        <ul>
        
          <li><a aria-label="facebook" href="">Facebook</a></li>
         
          <li><a aria-label="bitcointalk" href="" target="_blank">Slack</a></li>
       
          <li><a aria-label="telegram" href="https://www.instagram.com/teslafunds/" target="_blank">Instagram</a></li>
          <li><a aria-label="discord" href="https://discordapp.com/invite/F253vbY" target="_blank">Discord</a></li>
          <li><a aria-label="twitter" href="https://twitter.com/teslafunds" target="_blank">Twitter</a></li>
          <li><a aria-label="youtube" href="https://www.youtube.com/channel/UCKEo7uepoHCsAfu2JOd4akQ" target="_blank">Youtube</a></li>
          <li><a aria-label="reddit" href="https://www.reddit.com/user/teslafunds" target="_blank">Reddit</a></li>
        </ul>
      </div>

    </section></section>

    <p ng-show="showBlocks" class="text-right" style="font-size: 20px; color: ##0aa7f5;">Latest Block#: {{currentBlockNumber}}</p>

  </div>

  @@if (site === 'mew' ) { @@include( './footer-disclaimer-modal.tpl',   { "site": "mew" } ) }
  @@if (site === 'cx'  ) { @@include( './footer-disclaimer-modal.tpl',   { "site": "cx"  } ) }


</footer>
</main>
</body>
</html>
