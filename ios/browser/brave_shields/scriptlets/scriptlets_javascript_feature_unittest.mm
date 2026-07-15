// Copyright (c) 2026 The Brave Authors. All rights reserved.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.

#include "brave/ios/browser/brave_shields/scriptlets/scriptlets_javascript_feature.h"

#import <Foundation/Foundation.h>

#include "base/apple/foundation_util.h"
#include "base/strings/sys_string_conversions.h"
#include "base/test/ios/wait_util.h"
#include "brave/ios/browser/brave_shields/scriptlets/scriptlets_tab_helper.h"
#include "brave/ios/browser/brave_shields/scriptlets/scriptlets_tab_helper_bridge.h"
#include "ios/chrome/test/ios_chrome_test_with_web_state.h"
#include "ios/web/public/test/fakes/fake_web_client.h"
#include "ios/web/public/test/web_state_test_util.h"
#include "ios/web/public/web_client.h"
#include "ios/web/public/web_state.h"
#include "net/base/apple/url_conversions.h"
#include "testing/gtest/include/gtest/gtest.h"
#include "url/gurl.h"

@interface FakeScriptletsTabHelperBridge: NSObject <ScriptletsTabHelperBridge>
@end

@implementation FakeScriptletsTabHelperBridge

- (void)requestScriptletsForFrameURL:(NSURL*)frameURL
                          completion:(void (^)(NSArray<NSString*>* scriptlets))
                                         completion {
  completion(@[]);
}

@end

class ScriptletsJavaScriptFeatureTest: public IOSChromeTestWithWebState {
 protected:
  void SetUp() override {
    IOSChromeTestWithWebState::SetUp();

    static_cast<web::FakeWebClient*>(web::GetWebClient())
        ->SetJavaScriptFeatures(
            {ScriptletsJavaScriptFeature::GetInstance()});

    bridge_ = [[FakeScriptletsTabHelperBridge alloc] init];
    ScriptletsTabHelper::CreateForWebState(web_state());
    ScriptletsTabHelper::FromWebState(web_state())->SetBridge(bridge_);
  }

  FakeScriptletsTabHelperBridge* bridge_;
};

TEST_F(ScriptletsJavaScriptFeatureTest, TestScriptlet) {

}
