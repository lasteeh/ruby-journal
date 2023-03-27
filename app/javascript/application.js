// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

window.onload = function () {
  const categoryLinks = document.querySelectorAll(
    "#paperlinks [data-category]"
  );
  if (categoryLinks) {
    console.log("hi");
    categoryLinks.forEach(function (link) {
      link.addEventListener("click", function (event) {
        event.preventDefault();

        categoryLinks.forEach(function (link) {
          link.classList.remove("active");
        });
        this.classList.add("active");

        const categoryId = this.dataset.category;
        const taskLists = document.querySelectorAll(
          "#papertasks [data-category]"
        );

        taskLists.forEach(function (list) {
          if (categoryId == "all" || list.dataset.category == categoryId) {
            list.style.display = "block";
          } else {
            list.style.display = "none";
          }
        });
      });
    });
  }
};
