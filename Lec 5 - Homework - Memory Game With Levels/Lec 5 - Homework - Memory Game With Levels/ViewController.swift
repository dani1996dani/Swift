import UIKit

class ViewController: UIViewController {
    
    var maxLevel = 6
    
    @IBOutlet weak var selectLabelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevelButtons(maxLevel)
    }
    
    
    @IBAction func levelButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toLevel", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? LevelViewController
        let button = sender as? UIButton
        dest?.levelRecieved = (button?.tag)!
        dest?.maxLevel = maxLevel
        
    }
    
    func loadLevelButtons(_ amount : Int){
        
        var levelStacksContainer = UIStackView()
        levelStacksContainer.distribution = .fillEqually
        levelStacksContainer.axis = .vertical
        levelStacksContainer.spacing = 32.0
        
        var stackView : UIStackView?
        
        for i in 1...amount{
            let button = UIButton()
            button.setTitle("\(i)", for: .normal)
            button.backgroundColor = UIColor(red: 218/255, green: 165/255, blue: 32/255, alpha: 1)
            button.titleLabel?.font = button.titleLabel?.font.withSize(35.0)
            button.contentEdgeInsets = UIEdgeInsetsMake(15, 0, 15, 0)
            button.tag = i
            button.addTarget(self, action: #selector(levelButtonClicked(_:)), for: .touchUpInside)
            
            if i % 3 == 1{
                stackView = UIStackView()
                stackView?.distribution = .fillEqually
                stackView?.axis = .horizontal
                stackView?.spacing = 16.0
                levelStacksContainer.addArrangedSubview(stackView!)
            }
            stackView?.addArrangedSubview(button)
        }
        
        levelStacksContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelStacksContainer)
        
        levelStacksContainer.leftAnchor.constraint(equalTo: view.leftAnchor,constant:32).isActive = true
        levelStacksContainer.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-32).isActive = true
        levelStacksContainer.topAnchor.constraint(equalTo: selectLabelText.bottomAnchor,constant:32).isActive = true
    }
}

