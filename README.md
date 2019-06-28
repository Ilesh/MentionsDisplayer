# Mention User

<p align="center">
<img src="https://img.shields.io/badge/Swift-4.2-brightgreen.svg" alt="Swift 4.2"/>
<img src="https://img.shields.io/badge/platform-iOS-brightgreen.svg" alt="Platform: iOS"/>
<img src="https://img.shields.io/badge/Xcode-11%2B-brightgreen.svg" alt="XCode 11+"/>
<img src="https://img.shields.io/badge/iOS-11%2B-brightgreen.svg" alt="iOS 11+"/>
</a>
</p>

## Let's start
Here we're going to build a simple demo for mention user in the text. we can add user in the text and also the identify when we will send to the server whole text. It's working like the twitter mention user ;).

<p align="center">
    <img src= "https://i.imgflip.com/29p0xi.gif" > 
</p>

## Getting Started

Here download the sample project and get necessory files for your existing project or create new project. please check some steps and instruction below for implementing in your project.

##### Note: I am assumes you are comfortable with the basics of storyboards and view controllers.

## Installing

A regular way to use DropDown in your project would be using Embedded Framework. There are two approaches, using source code and adding submodule.

Add source code:

* Download the latest code version.
* Unzip the download file, copy DropDown folder to your project folder.
* Customise cell abording your UI.


## Usage
It is very easy to use only simply put configure methods in your "ViewdidLoad" method. Please find below code.

```
MyDropDown.shared.ConfigureMentionList(viewDropDown: txtView, successBlock: { (index, arrResult, strSearchKey) in
    let strName = arrResult[index]
    if  strSearchKey == "@" {
        self.txtView.text.append("\(strName) ")
    }else{
        self.txtView.text = self.txtView.text.replacingOccurrences(of: strSearchKey, with: "")
        self.txtView.text.append("@\(strName) ")
}

}) {

}
```
 After that, implement textview or textField delegate methods for getting text for filter the list.

```
func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        MyDropDown.shared.SearchMentionsTextFieldShowChagne(text: text, strFullString: textView.text ?? "")
return true
}
```
## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## 👨🏻‍💻 Author

* **[Ilesh Panchal](https://twitter.com/ilesh_panchal)**

<a href="https://www.buymeacoffee.com/dD9nr61qx" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/black_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Credits

* Thanks to "AssistoLab" for Amazing **Dropdown** repo.


