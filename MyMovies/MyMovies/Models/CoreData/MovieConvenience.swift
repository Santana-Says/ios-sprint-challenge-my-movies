//
//  MovieConvenience.swift
//  MyMovies
//
//  Created by Jeffrey Santana on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Movie {
	
	@discardableResult convenience init(identifier: UUID = UUID(), title: String, movieId: Int, hasWatched: Bool = false,
										context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
		self.init(context: context)
		
		self.identifier = identifier
		self.title = title
		self.movieId = Double(movieId)
		self.hasWatched = hasWatched
	}
	
	//EntryRepresentation -> Task
	
	convenience init?(movieRepresentation: MovieRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
		guard movieRepresentation.identifier != nil else { return nil }
		
		self.init(identifier: movieRepresentation.identifier ?? UUID(),
				  title: movieRepresentation.title ?? "Missing Title",
				  movieId: movieRepresentation.id ?? 0,
				  hasWatched: movieRepresentation.hasWatched ?? false,
				  context: context)
	}
	
	//Task -> EntryRepresentation
	
	var movieRepresentation: MovieRepresentation {
		return MovieRepresentation(title: title, id: Int(movieId), identifier: identifier, hasWatched: hasWatched)
	}
}
