//
//  ProductsData.swift
//  ReaderApp
//
//  Created by Normsoftware on 7/23/25.
//

import Foundation

// MARK: - Welcome
class ProductData : Codable {
    let products: [Product]
    let total, skip, limit: Int

    init(products: [Product], total: Int, skip: Int, limit: Int) {
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}

// MARK: - Product
class Product: Codable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String

    init(id: Int, title: String, description: String, category: Category, price: Double, discountPercentage: Double, rating: Double, stock: Int, tags: [String], brand: String?, sku: String, weight: Int, dimensions: Dimensions, warrantyInformation: String, shippingInformation: String, availabilityStatus: AvailabilityStatus, reviews: [Review], returnPolicy: ReturnPolicy, minimumOrderQuantity: Int, meta: Meta, images: [String], thumbnail: String) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.tags = tags
        self.brand = brand
        self.sku = sku
        self.weight = weight
        self.dimensions = dimensions
        self.warrantyInformation = warrantyInformation
        self.shippingInformation = shippingInformation
        self.availabilityStatus = availabilityStatus
        self.reviews = reviews
        self.returnPolicy = returnPolicy
        self.minimumOrderQuantity = minimumOrderQuantity
        self.meta = meta
        self.images = images
        self.thumbnail = thumbnail
    }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// MARK: - Dimensions
class Dimensions: Codable {
    let width, height, depth: Double

    init(width: Double, height: Double, depth: Double) {
        self.width = width
        self.height = height
        self.depth = depth
    }
}

// MARK: - Meta
class Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String

    init(createdAt: CreatedAt, updatedAt: CreatedAt, barcode: String, qrCode: String) {
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.barcode = barcode
        self.qrCode = qrCode
    }
}

enum CreatedAt: String, Codable {
    case the20250430T094102053Z = "2025-04-30T09:41:02.053Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// MARK: - Review
class Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String

    init(rating: Int, comment: String, date: CreatedAt, reviewerName: String, reviewerEmail: String) {
        self.rating = rating
        self.comment = comment
        self.date = date
        self.reviewerName = reviewerName
        self.reviewerEmail = reviewerEmail
    }
}


