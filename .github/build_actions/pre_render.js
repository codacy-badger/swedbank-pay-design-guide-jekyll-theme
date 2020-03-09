const siteFolder = './_site/';
const fs = require('fs');
const path = require('path');
const jsdom = require("jsdom");
const {
  JSDOM
} = jsdom;

const getAllFiles = function (dirPath, arrayOfFiles) {
  files = fs.readdirSync(dirPath);
  arrayOfFiles = arrayOfFiles || [];

  files.forEach(function (file) {
    if (fs.statSync(dirPath + "/" + file).isDirectory()) {
      arrayOfFiles = getAllFiles(dirPath + "/" + file, arrayOfFiles)
    } else {
      arrayOfFiles.push(path.join("./", dirPath, "/", file))
    }
  });

  return arrayOfFiles
}

const renderFileAndRemoveMermaidScript = function (filename) {
  if (filename != "_site\\index.html")
    return;
  const resolvedPath = path.resolve(siteFolder);
  const options = {
    pretendToBeVisual: true,
    resources: "usable",
    runScripts: "dangerously",
    //url: resolvedPath,
    documentRoot: `file://o:/Git/swedbank-pay-design-guide-jekyll-theme/_site`
  };

  JSDOM.fromFile(`${filename}`, options).then(dom => {

    let result = dom.serialize();
    fs.writeFileSync(filename, result);
  });
}

var allFiles = getAllFiles(siteFolder).filter(function (e) {
  return e.includes(".html");
});


allFiles.forEach(element => {
  fs.readFile(element, "UTF-8", function (err, content) {
    renderFileAndRemoveMermaidScript(element);
  })
});