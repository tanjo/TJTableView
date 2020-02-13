# TJTableView

![GitHub](https://img.shields.io/github/license/tanjo/TJTableView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- UIKit framework

## Installation

TJTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TJTableView', :git => 'https://github.com/tanjo/TJTableView.git', :tag => '0.1.0'
```

## Usage

### TableViewCell without xib

```swift
class TJTableViewCell: UITableViewCell, ClassRegistrable {
  // ...
}
```

### TableViewCell with xib

Create together with TJTableViewCell.xib

```swift
class TJTableViewCell: UITableViewCell, NibRegistrable {

  @IBOutlet weak var titleLabel: UILabel!

  var title: {
    didSet {
      self.titleLabel = title
    }
  }
}
```

### ViewController

```swift
class TJViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.registers([UITableView.self, TJTableView.self])
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
      return 2
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
      case 0:
        let cell = tableView.dequeueReusableCell(for: indexPath) as UITableViewCell
        cell.title = "UITableViewCell"
        return cell
      case 1:
        let cell = tableView.dequeueReusableCell(for: indexPath) as TJTableViewCell
        cell.title = "TJTableViewCell"
        return cell
      default:
        let cell = tableView.dequeueReusableCell(for: indexPath) as UITableViewCell
        cell.title = "-"
        return cell
    }
  }

  // MARK: - Table view delegate

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
```

## Author

tanjo, tanjo@users.noreply.github.com

## License

TJTableView is available under the MIT license. See the LICENSE file for more info.
