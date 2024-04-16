// Ensure the DOM content is loaded before accessing elements
document.addEventListener("DOMContentLoaded", function () {
    // Get the select dropdown element
    const fontSizeSelect = document.getElementById("fontSizeSelect");

    // Add event listener to handle font size change
    fontSizeSelect.addEventListener("change", function () {
        const selectedFontSize = fontSizeSelect.value;

        // Get all anchor elements inside the sidebar menu
        const sidebarLinks = document.querySelectorAll(".sidebar-menu li a");

        sidebarLinks.forEach(function (link) {
            switch (selectedFontSize) {
                case "small":
                    link.style.fontSize = "14px";
                    break;
                case "medium":
                    link.style.fontSize = "17px";
                    break;
                case "large":
                    link.style.fontSize = "20px";
                    break;
                default:
                    link.style.fontSize = "14px"; 
            }
        });

        const headings = document.querySelectorAll("h1, h2, h3");
        headings.forEach(function (heading) {
            switch (selectedFontSize) {
                case "small":
                    heading.style.fontSize = "16px";
                    break;
                case "medium":
                    heading.style.fontSize = "24px";
                    break;
                case "large":
                    heading.style.fontSize = "32px";
                    break;
                default:
                    heading.style.fontSize = "24px"; 
            }
        });

        const paragraphs = document.querySelectorAll("p");
        paragraphs.forEach(function (paragraph) {
            switch (selectedFontSize) {
                case "small":
                    paragraph.style.fontSize = "14px";
                    break;
                case "medium":
                    paragraph.style.fontSize = "16px";
                    break;
                case "large":
                    paragraph.style.fontSize = "18px";
                    break;
                default:
                    paragraph.style.fontSize = "16px"; 
            }
        });

        // Change font size for input elements
        const inputs = document.querySelectorAll("input");
        inputs.forEach(function (input) {
            switch (selectedFontSize) {
                case "small":
                    input.style.fontSize = "14px";
                    break;
                case "medium":
                    input.style.fontSize = "16px";
                    break;
                case "large":
                    input.style.fontSize = "18px";
                    break;
                default:
                    input.style.fontSize = "16px"; 
            }
        });
    });
});
