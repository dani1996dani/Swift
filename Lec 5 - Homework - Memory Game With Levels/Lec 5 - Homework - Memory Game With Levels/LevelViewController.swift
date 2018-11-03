import UIKit

class LevelViewController: UIViewController {
    
    var levelRecieved  = 0
    var maxLevel = 0
    
    @IBOutlet weak var levelLabel: UILabel!
    var cards : [UIButton] = []
    var fruitArray : [UIImage]  = []
    var firstCard : UIButton? = nil
    @IBOutlet weak var nextLevelButton: UIButton!
    var layoutContainter = UIStackView()
    var levelPoints = 0
    
    var images = [
        UIImage(named : "icons8-beet"),
        UIImage(named : "icons8-coconut"),
        UIImage(named : "icons8-kiwi"),
        UIImage(named : "icons8-peach"),
        UIImage(named : "icons8-pineapple"),
        UIImage(named : "icons8-plant_under_sun"),
        UIImage(named : "icons8-watermelon"),
        UIImage(named : "icons8-yellow_corn_1")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(levelRecieved)
        createLevel()
    }
    
    func createLevel(){
        fruitArray = createFruitArray(with: levelRecieved)
        generateLayout(with: levelRecieved * 2)
        hideAllCards()
        levelLabel.text = "Level \(levelRecieved)"
        nextLevelButton.isEnabled = false
        if levelRecieved >= maxLevel{
            nextLevelButton.isHidden = true
        }
    }
    
    func generateLayout(with amount : Int){
        
        
        
        layoutContainter = UIStackView()
        layoutContainter.axis = .vertical
        layoutContainter.distribution = .fillEqually
        layoutContainter.spacing = 16.0
        
        layoutContainter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(layoutContainter)
        
        layoutContainter.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0).isActive = true
        layoutContainter.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        layoutContainter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16.0).isActive = true
        layoutContainter.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 16.0).isActive = true
        
        var stackView : UIStackView = UIStackView()
        for i in 0..<amount{
            if i % 2 == 0{
                stackView = UIStackView()
                stackView.axis = .horizontal
                stackView.distribution = .fillEqually
                stackView.spacing = 16.0
                
                layoutContainter.addArrangedSubview(stackView)
            }
            
            let button = UIButton()
            button.backgroundColor = UIColor.orange
            //            button.setTitle("STUB", for: .normal)
            button.contentEdgeInsets = UIEdgeInsetsMake(15, 0, 15, 0)
            button.setImage(fruitArray[i], for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(cardTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            
            cards.append(button)
            
        }
    }
    
    func createFruitArray(with amount : Int) -> [UIImage]{
        var fruitArray : [UIImage] = []
        var imagesCopy = images
        for _ in 0..<amount{
            let fruit = imagesCopy.remove(at: rand(upperBound: imagesCopy.count))
            fruitArray.append(fruit!)
            fruitArray.append(fruit!)
        }
        
        var result : [UIImage] = []
        
        while fruitArray.count > 0{
            result.append(fruitArray.remove(at: rand(upperBound: fruitArray.count)))
        }
        
        return result
    }
    
    func rand(upperBound : Int) -> Int{
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
    
    func hideAllCards(){
        for card in cards {
            card.setImage(nil, for: .normal)
            card.isEnabled = true
        }
    }
    
    @IBAction func cardTapped(_ sender : UIButton){
        sender.setImage(fruitArray[sender.tag], for: .normal)
        checkMatch(sender)
    }
    
    func checkMatch(_ sender : UIButton){
        if firstCard == nil{
            firstCard = sender
        }
        else if firstCard?.currentImage == sender.currentImage{
            print("SUCCESS")
            levelPoints += 1
            if levelPoints == levelRecieved{
                nextLevelButton.isEnabled = true
            }
            firstCard = nil
        }
        else{
            print("foo")
            firstCard = nil
            for card in cards{
                card.isEnabled = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.hideAllCards()
            })
        }
    }
    
    
    @IBAction func goToNextLevel(_ sender: UIButton) {
        levelPoints = 0
        layoutContainter.removeFromSuperview()
        levelRecieved += 1
        createLevel()
    }
    
    
}
