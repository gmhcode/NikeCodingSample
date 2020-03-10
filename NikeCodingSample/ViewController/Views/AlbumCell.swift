//
//  AlbumCell.swift
//  NikeCodingSample
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    var album : Album? {
        didSet{
            setViews()
        }
    }
    
    var albumCoverImageView = UIImageView()
    var artistNameLabel = UILabel()
    var albumNameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(albumCoverImageView)
        addSubview(artistNameLabel)
        addSubview(albumNameLabel)
        configureImageView()
        configureArtistNameLabel()
        configureAlbumNameLabel()
        setImageConstraints()
        setArtistNameLabelConstraints()
        setAlbumNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("initCoder has not been implemented")
    }
    
    
    func setViews() {
        guard let album = album else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        FetchController.shared.retrieveImageFromCache(album: album) { (image) in
            DispatchQueue.main.async {
                self.albumCoverImageView.image = image
                self.artistNameLabel.text = "Artist: " + album.artistName
                self.albumNameLabel.text = "Album: " + album.name
            }
        }
    }
    
    
    
    func configureImageView() {
        albumCoverImageView.layer.cornerRadius = 10
        albumCoverImageView.clipsToBounds = true
    }
    
    
    func configureArtistNameLabel() {
        artistNameLabel.numberOfLines = 0
        artistNameLabel.adjustsFontSizeToFitWidth = true
    }
    func configureAlbumNameLabel(){
        albumNameLabel.numberOfLines = 0
        albumNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    func setImageConstraints() {
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        albumCoverImageView.widthAnchor.constraint(equalTo: albumCoverImageView.heightAnchor).isActive = true
        
    }
    
    func setAlbumNameLabelConstraints() {
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 20).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 5).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        
    }
    
    func setArtistNameLabelConstraints() {
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 20).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.topAnchor, constant: 15).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

}
