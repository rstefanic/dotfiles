(defun full-row ()
  (insert
"<br>
 <div class=\"resp-row\">
   <div contenteditable=\"false\" class=\"column full\">
     <div contenteditable=\"true\" class=\"inner-column\">

     </div>
   </div>
   <div class=\"clear\"></div>
 </div>
 <br>"))

(defun fifty-fifty ()
  (insert
"<br>
 <div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column half\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column half\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div class=\"clear\"></div>
 </div>
 <br>"))

(defun sixty-forty ()
  (insert
"<br>
 <div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column sixty\">
   <div contenteditable=\"true\" class=\"inner-column\">

   </div>
  </div>
   <div contenteditable=\"false\" class=\"column forty\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
   </div>
  <div class=\"clear\"></div>
 </div>
 <br>"))

(defun forty-sixty ()
  (insert
"<br>
 <div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column forty\">
   <div contenteditable=\"true\" class=\"inner-column\">

   </div>
  </div>
  <div contenteditable=\"false\" class=\"column sixty\">
   <div contenteditable=\"true\" class=\"inner-column\">

   </div>
  </div>
  <div class=\"clear\"></div>
 </div>
 <br>"))

(defun seventyfive-twentyfive ()
  (insert
"<br>
 <div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column threequarter\">
   <div contenteditable=\"true\" class=\"inner-column\">

   </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div class=\"clear\"></div>
 </div>
 <br>"))

(defun twentyfive-seventyfive ()
  (insert
"<br>
<div class=\"resp-row\">
 <div contenteditable=\"false\" class=\"column quarter\">
  <div contenteditable=\"true\" class=\"inner-column\">

  </div>
 </div>
 <div contenteditable=\"false\" class=\"column threequarter\">
   <div contenteditable=\"true\" class=\"inner-column\">

   </div>
 </div>
 <div class=\"clear\"></div>
</div>
<br>"))

(defun three-third ()
  (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column third\">
   <div contenteditable=\"true\" class=\"inner-column\">

   </div>
  </div>
  <div contenteditable=\"false\" class=\"column third\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column third\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
<div class=\"clear\"></div>
</div>
<br>"))

(defun quarter-quarter-fifty
    (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column half\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div class=\"clear\"></div>
</div>
<br>"))

(defun fifty-quarter-quarter
    (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column half\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div class=\"clear\"></div>
</div>
<br>"))

(defun quarter-fifty-quarter
    (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column half\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter\">
    <div contenteditable=\"true\" class=\"inner-column\">
  
    </div>
  </div>
  <div class=\"clear\"></div>
</div>
<br>"))

(defun four-quarters
    (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column quarter four-column\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter four-column\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter four-column\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div contenteditable=\"false\" class=\"column quarter four-column\">
    <div contenteditable=\"true\" class=\"inner-column\">

    </div>
  </div>
  <div class=\"clear\"></div>
</div>
<br>"))

(defun floated-img-left
    (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column\">
    <div contenteditable=\"true\" class=\"img-row\">
      <div class=\"img-left-flt\"><img src=\"/images/editor_templates/placeholder.png\"></div>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</div>
      <div class=\"clear\"></div>
  </div>
  <div class=\"clear\"></div>
</div>
<br>"))

(defun floated-img-right
    (insert
"<br>
<div class=\"resp-row\">
  <div contenteditable=\"false\" class=\"column\">
    <div contenteditable=\"true\" class=\"img-row\">
      <div class=\"img-right-flt\"><img src=\"/images/editor_templates/placeholder.png\"></div>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</div>
      <div class=\"clear\"></div>
    </div>
  <div class=\"clear\"></div>
</div>
<br>"))

(defun lorem-ipsum-1 ()
  (insert "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id odio iaculis, mollis libero sed, aliquet massa. Etiam vel ligula vel mauris gravida porttitor. Phasellus lacinia laoreet diam, vel eleifend quam luctus vel. Quisque convallis augue sit amet tortor venenatis consectetur. Suspendisse ac massa sodales dui sagittis hendrerit. Ut vitae ante sagittis, ultrices lacus eget, sollicitudin eros. Donec at purus quis massa interdum condimentum. Vestibulum hendrerit urna tellus, nec pulvinar sem congue ac. In fermentum ultrices efficitur. Nullam sagittis, dolor at vestibulum blandit, quam enim pharetra felis, eu rutrum est diam ac leo. Donec efficitur quam et ex sodales blandit vel sit amet erat. In vitae erat turpis. Praesent eget fringilla dolor."))

(defun lorem-ipsum-2 ()
  (insert "Pellentesque sit amet rutrum nunc. Donec sagittis dolor in semper volutpat. Aenean ut diam neque. Integer in nisi eu elit feugiat vulputate. Ut eget leo risus. Pellentesque ultricies purus justo, eu dignissim risus ultrices sed. Praesent tincidunt aliquet enim nec consequat. Suspendisse congue turpis quis risus bibendum, et congue massa mollis. Donec quis dolor ullamcorper, sagittis ex sed, accumsan ligula. Vestibulum sagittis lacus in tellus sagittis tempus. Cras neque risus, mollis non velit vel, mollis finibus nunc. Curabitur euismod libero velit, vel semper lorem scelerisque sed."))

(defun lorem-ipsum-3 ()
  (insert "Curabitur mi mauris, malesuada fringilla tincidunt non, pulvinar a ante. In ut massa suscipit, fringilla augue vitae, accumsan mi. Donec at aliquam arcu. Etiam vulputate interdum arcu id rutrum. Aenean finibus iaculis cursus. Ut nisi tortor, dictum ac tincidunt in, posuere vitae sem. Integer leo tellus, tempus et ornare quis, tincidunt ac dolor. Nullam non nibh nec erat imperdiet condimentum vel posuere ante. Quisque vel mattis lectus. Vivamus vulputate tortor nibh, nec scelerisque libero sodales vel. Proin non felis sit amet tellus faucibus ultricies non sed nisl. Morbi consequat lectus in tellus condimentum, ut congue libero varius. Aenean at erat tincidunt, tempor enim vel, commodo est."))
