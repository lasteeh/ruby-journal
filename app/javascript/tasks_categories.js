document.addEventListener("DOMContentLoaded", function () {
  const categoryLinks = document.querySelectorAll(
    "#paperlinks [data-category]"
  );

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
});
