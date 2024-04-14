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

  // For Typewriting effect

  // Function to apply typing effect
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

  // Function to handle scroll event
  function handleScroll() {
    $("article h2").each(function () {
      const $h2 = $(this);

      if ($.inViewport($h2) && !$h2.data("typed")) {
        const txt = $h2.text();
        type($h2, txt);
        $h2.data("typed", true);
      }
    });
  }

  // jQuery extension to check if an element is in the viewport
  $.inViewport = function ($element) {
    const elementTop = $element.offset().top;
    const elementBottom = elementTop + $element.outerHeight();
    const viewportTop = $(window).scrollTop();
    const viewportBottom = viewportTop + $(window).height();

    return elementBottom > viewportTop && elementTop < viewportBottom;
  };

  // Add scroll event listener
  $(window).on("scroll", handleScroll);

  // Initial check on page load
  handleScroll();
});
