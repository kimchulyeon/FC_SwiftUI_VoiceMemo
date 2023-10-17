//
//  OnboardingView.swift
//  FC_SwiftUI
//
//  Created by chulyeon kim on 10/17/23.
//

import SwiftUI

// MARK: - 온보딩 뷰
struct OnboardingView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()

    var body: some View {
        OnboardingContentView(onboardingViewModel: onboardingViewModel)
    }
}

// MARK: - 온보딩 컨텐츠 뷰
private struct OnboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel

    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }

    fileprivate var body: some View {
        VStack{
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            Spacer()
            StartButtonView()
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - 온보딩 셀 리스트 뷰
private struct OnboardingCellListView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex: Int

    fileprivate init(onboardingViewModel: OnboardingViewModel, selectedIndex: Int = 0) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }

    fileprivate var body: some View {
        TabView(selection: $selectedIndex,
                content: {
                    // 온보딩 셀 뷰
                    ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                        OnboardingCellView(onboardingContent: onboardingContent)
                            .tag(index)
                    }
                })// TabView
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
                .background(
                    selectedIndex % 2 == 0
                    ? Color.sky
                    : Color.backgroundGreen
                )
                .clipped()
    }
}

// MARK: - 온보딩 셀 뷰
private struct OnboardingCellView: View {
    private var onboardingContent: OnboardingContent

    fileprivate init(onboardingContent: OnboardingContent) {
        self.onboardingContent = onboardingContent
    }

    fileprivate var body: some View {
        VStack {
            Image(onboardingContent.imageFileName)
                .resizable()
                .scaledToFit()

            HStack {
                Spacer()
                VStack {
                    Spacer()
                        .frame(height: 46)
                    Text(onboardingContent.title)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                        .frame(height: 5)
                    Text(onboardingContent.subtitle)
                        .font(.system(size: 16))
                }
                Spacer()
            }// HStack
            .background(Color.white)
                .cornerRadius(0)
        }// VStack
        .shadow(radius: 10)
    }
}

// MARK: - 시작하기 버튼 뷰
private struct StartButtonView: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
                Text("시작하기")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.green)
                
                Image("startHome")
                    .renderingMode(.template)
                    .foregroundColor(.green)
            }
        })
    }
}


#Preview {
    OnboardingView()
}
