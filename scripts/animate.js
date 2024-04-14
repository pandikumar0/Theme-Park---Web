$(document).ready(function () {
  console.log("Jquey work");
  $("section .bordered").hover(
    function () {
      // Mouse enter
      $(this).stop().animate(
        {
          width: "110%", // increase width
          height: "110%", // increase height
        },
        fast
      );
      console.log("zoom works");
    },
    function () {
      // Mouse leave
      $(this).stop().animate(
        {
          width: "100%", // original width
          height: "100%", // original height
        },
        300
      );
    }
  );

  //                   For Typewriting effect
  //               Function to apply typing effect
  function type(e, txt, i = 0) {
    if (i === 0) {
      e.text("");
    }
    e.text(e.text() + txt[i]);

    if (i === txt.length - 1) {
      return;
    }
    setTimeout(() => type(e, txt, i + 1), 50);
  }

  // Initialize Waypoints Inview
  $("article h2").waypoint({
    handler: function (direction) {
      const $h2 = $(this.element);

      if (!$h2.data("typed")) {
        const txt = $h2.text();
        type($h2, txt);
        $h2.data("typed", true);
      }

      // Destroy waypoint after triggering to prevent multiple triggers
      this.destroy();
    },
    offset: "bottom-in-view",
  });

  //                  Animate Gallery
  function animateElement(selector, animation_name) {
    $(selector).waypoint(
      function () {
        $(selector).addClass("animate__animated " + animation_name);
        // setTimeout(() => {
        //   $(selector).removeClass("animate__animated " + animation_name); }, 1000);
      },
      { offset: "bottom-in-view" }
    );
  }

  animateElement(".section-img", "animate__zoomIn");
  animateElement(".content-section p", "animate__fadeInLeft");
});
