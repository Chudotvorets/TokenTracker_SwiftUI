//
//  ContentView.swift
//  TokenTracker
//
//  Created by dev on 20.11.2024.
//

import SwiftUI

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

struct ProductCarouselView: View {
    @State private var currentIndex = 0
    @State private var offset: CGFloat = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    private let products = [
        Product(name: "Product 1", description: "Description of Product 1", imageName: "product1"),
        Product(name: "Product 2", description: "Description of Product 2", imageName: "product2"),
        Product(name: "Product 3", description: "Description of Product 3", imageName: "product3")
    ]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(products.indices, id: \.self) { index in
                            NavigationLink(destination: ProductDetailView(product: products[index])) {
                                ZStack {
                                    Color.gray.opacity(0.2)
                                        .frame(width: 300, height: 200)
                                        .cornerRadius(15)

                                    VStack {
                                        Image(products[index].imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)

                                        Text(products[index].name)
                                            .font(.headline)
                                            .padding(.top, 10)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .offset(x: -CGFloat(currentIndex) * 320) // Позиционируем текущий товар
                    .animation(.easeInOut, value: currentIndex)
                }
                .gesture(
                    DragGesture()
                        .onEnded { gesture in
                            let dragThreshold: CGFloat = 50
                            if gesture.translation.width < -dragThreshold {
                                // Листаем вправо
                                currentIndex = min(currentIndex + 1, products.count - 1)
                            } else if gesture.translation.width > dragThreshold {
                                // Листаем влево
                                currentIndex = max(currentIndex - 1, 0)
                            }
                        }
                )

                Spacer()
            }
            .navigationTitle("Products")
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % products.count
                }
            }
        }
    }
}

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(spacing: 20) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(10)

            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(product.description)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(product.name)
    }
}

struct ContentView: View {
    var body: some View {
        ProductCarouselView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
