# MentionDisplayer

<p align="center">
<img src="https://img.shields.io/badge/Swift-3.0-orange.svg" alt="Swift 3.0"/>
<img src="https://img.shields.io/badge/platform-iOS-brightgreen.svg" alt="Platform: iOS"/>
<img src="https://img.shields.io/badge/Xcode-9%2B-brightgreen.svg" alt="XCode 9+"/>
<img src="https://img.shields.io/badge/iOS-11%2B-brightgreen.svg" alt="iOS 11"/>
</a>
</p>

MentionDisplayer is helpfull for the display mention user list with the filter.

![ezgif com-optimize](https://i.imgflip.com/29p0xi.gif)


## Getting Started

Download the demo app and find the necessary files for the demo project.


### Installing

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

## Authors

* **[Ilesh Panchal](https://github.com/ilesh)** 


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Credits

* Thanks to "AssistoLab" for Amazing Dropdown repo.


