//
//  DetailViewController.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 7.02.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(named: "darkModeColor")
        return scrollView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = -1
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Nullam ac tortor vitae purus faucibus. Purus viverra accumsan in nisl nisi scelerisque eu. Purus in massa tempor nec. Libero id faucibus nisl tincidunt eget nullam non. Dui faucibus in ornare quam viverra orci sagittis. Pellentesque habitant morbi tristique senectus et netus et malesuada. Neque sodales ut etiam sit amet. Pellentesque pulvinar pellentesque habitant morbi tristique senectus. Est ultricies integer quis auctor elit sed. Tincidunt vitae semper quis lectus nulla. Porttitor massa id neque aliquam vestibulum morbi blandit cursus risusiam maecenas ultricies mi eget mauris. Sed blandit libero volutpat sed. Ut ornare lectus sit amet. In pellentesque massa placerat duis. Cursus sit amet dictum sit amet justo donec. In nulla posuere sollicitudin aliquam ultrices sagittis orci a. Phasellus vestibulum lorem sed risus ultricies. Euismod quis viverra nibh cras pulvinar mattis nunc. Ultricies lacus sed turpis tincidunt id aliquet. Aenean pharetra magna ac placerat vestibulum lectus mauris ultrices. Gravida dictum fusce ut placerat orci nulla pellentesque. Ut porttitor leo a diam sollicitudin tempor id eu nisl. At tellus at urna condimentum mattis pellentesque. Eu facilisis sed odio morbi quis commodo odio.Pulvinar proin gravida hendrerit lectus a. Pretium fusce id velit ut. Tempus egestas sed sed risus pretium. In iaculis nunc sed augue lacus viverra. Nunc consequat interdum varius sit. Auctor urna nunc id cursus. Ultricies leo integer malesuada nunc vel risus commodo viverra. Nisl nunc mi ipsum faucibus vitae aliquet. Morbi blandit cursus risus at ultrices mi tempus imperdiet nulla. Vitae turpis massa sed elementum tempus egestas sed sed risus. Est loreegestas sed sed risus. Est lorem ipsum dolor sit amet. Condimentum mattis pellentesque id nibh.Felis eget nunc lobortis mattis aliquam faucibus purus in. Purus ut faucibus pulvinar elementum integer enim. Ultrices vitae auctor eu augue ut. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi.neque egestas congue quisque egestas. Volutpat commodo sed egestas egestas fringilla phasellus. Cras adipiscing enim eu turpis egestas pretium aenean. Nisl rhoncus mattis rhoncus urna neque viverra justo. Faucibus interdum posuere lorem ipsum dolor sit amet consectetur. Venenatis lectus magna fringilla urna. id consectetur purus ut faucibus pulvinar elementum. Nullam ac tortor vitae purus faucibus. Purus viverra accuesque massa pllacerat duis. Cursus sit amet dictum sit amet justo donec. In nulla posuere sollicitudin aliquam ultrices sagittis orci a. Phasellus vestibulum lorem sed risus ultricies. Euismod quis viverra nibh cras pulvinar mattis nunc. Ultricies lacus sed turpis tincidunt id aliquet. Aenean pharetra magna ac placerat vestibulum lectus mauris ultrices. Gravida dictum fusce ut placerat orci nulla pellentesque. Ut porttitor leo a diam sollicitudin tempor id eu nisl. At tellus at urna condimentum mattis pellentesque. Eu facilisis sed odio morbi quis commodo odio.Pulvinar proin gravida hendrerit  Mustafa Altıparmak"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(label)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        //scrollView.contentSize = CGSize(width:2000, height: 5678)
        //scrollView.contentSize = view.bounds.size
        
       
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20)
        ])
        
    }
    
    
    //To set dynamic content size
    override func viewDidAppear(_ animated: Bool) {
        //After view layout its subviews, i can get the calculated height of the label
        let size = CGSize(width: view.frame.size.width, height: label.frame.size.height)
        scrollView.contentSize = size
    }
    

}
