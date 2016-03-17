//
//  ViewController.m
//  MultiPeerConnectivity
//
//  Created by Huang XiaoWen on 14-4-8.
//  Copyright (c) 2014年 Huang XiaoWen. All rights reserved.
//

#import "ViewController.h"
#define SERVICE_TYPE @"etayu"



@interface Dis : NSObject
@property (nonatomic, weak) CADisplayLink *link;

@end

@implementation Dis

- (void)aaa {
    __weak typeof(self) weakself = self;
    self.link = [CADisplayLink displayLinkWithTarget:weakself selector:@selector(bb)];
    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//    [_link removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)bb {
    
}
- (void)dealloc {
    NSLog(@"dealloc");
}


@end

@interface ViewController ()<MCNearbyServiceBrowserDelegate, MCNearbyServiceAdvertiserDelegate>
@property(nonatomic,retain) IBOutlet UISwitch *serverSwitch;
@property(nonatomic,retain) IBOutlet UIButton *clientStopButton;
@property(nonatomic,retain) IBOutlet UIButton *clientStartButton;

@property(nonatomic,retain) MCPeerID *peelId;
@property(nonatomic,retain) MCSession *session;

@property (nonatomic, strong) MCNearbyServiceAdvertiser *dAdvertiserAssistant;
@property (nonatomic, strong) MCNearbyServiceBrowser *dBrowser;
@property (nonatomic, strong) NSMutableArray *mutableBlockedPeers;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *laebl;

@end

@implementation ViewController

#pragma mark- 界面处理
-(void)serverStateChangeClientButton{
    if (_serverSwitch.on) {
        [_clientStartButton setEnabled:NO];
        [_clientStopButton setEnabled:NO];
    }else{
        [_clientStartButton setEnabled:YES];
        [_clientStopButton setEnabled:YES];
    }
}

#pragma mark- 重写
- (void)viewDidLoad{
    [super viewDidLoad];
    self.peelId = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
    _session = [[MCSession alloc] initWithPeer:_peelId
                                        securityIdentity:nil
                                    encryptionPreference:MCEncryptionNone];
    _session.delegate = self;

    
    _serverSwitch.on = NO;
    [self serverStateChangeClientButton];
    self.mutableBlockedPeers = [NSMutableArray array];
    
    
    Dis *dis = [[Dis alloc] init];
    [dis aaa];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 操作
-(void)disconnectSession{
    if (_session) {
        [_session disconnect];
    }
}

#pragma mark- 消息事件
-(IBAction)serverValueChange:(id)sender{
    [self serverStateChangeClientButton];
    if (_serverSwitch.on) {
        if (_dAdvertiserAssistant == nil) {
           
            self.dAdvertiserAssistant = [[MCNearbyServiceAdvertiser alloc] initWithPeer:_peelId discoveryInfo:nil serviceType:SERVICE_TYPE];
            _dAdvertiserAssistant.delegate = self;
            [_dAdvertiserAssistant startAdvertisingPeer];
        }
    }else{
        [self disconnectSession];
    }
}

-(IBAction)clientStart:(id)sender{

    
    if (_dBrowser == nil) {
        self.dBrowser = [[MCNearbyServiceBrowser alloc] initWithPeer:_peelId serviceType:SERVICE_TYPE];
        _dBrowser.delegate = self;
        [_dBrowser startBrowsingForPeers];
    }
}

-(IBAction)clientStop:(id)sender{
    [self disconnectSession];
}

#pragma mark- MCSessionDelegate
//会话状态发生改变  当我们接受别人的邀请的时候，就会触发下面的会话回调，表明，有人连接我们了，或者拒绝我们的邀请了。
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{
    NSLog(@"session:%@ peer:%@ didChangeState:%ld",session,peerID,state);
    
}

// Received data from remote peer
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{
//    NSLog(@"session:%@ didReceiveData:%@ fromPeer:%@",session,data,peerID);
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"收到图片" message:@"" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//    [alert show];
    NSLog(@"收到图片");
    static int i = 0;
    dispatch_async(dispatch_get_main_queue(), ^{
        _laebl.text = [NSString stringWithFormat:@"收到图片%d", i++];
    });
}

// Received a byte stream from remote peer
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{
    NSLog(@"session:%@ didReceiveStream:%@ fromPeer:%@",session,stream,peerID);
}

// Start receiving a resource from remote peer
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{
    NSLog(@"session:%@ didStartReceivingResourceWithName:%@ fromPeer:%@ withProgress:%@",session,resourceName,peerID,progress);
}

// Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{
    NSLog(@"session:%@ didStartReceivingResourceWithName:%@ fromPeer:%@ atURL:%@ withError:%@",session,resourceName,peerID,localURL,error);
}

#pragma mark - MCNearByServiceBrowserDelete

//开启浏览器失败
- (void)browser:(MCNearbyServiceBrowser *)browser didNotStartBrowsingForPeers:(NSError *)error {
    NSLog(@"开启浏览器失败");
}
//发现附近的用户
- (void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info {
    NSLog(@"发现附近的用户peerID:%@", peerID);
    [browser invitePeer:peerID toSession:_session withContext:[@"123" dataUsingEncoding:NSUTF8StringEncoding] timeout:10];
}
//某个用户消失了
- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID {
    NSLog(@"某个用户消失了");

}

#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler {
    NSLog(@"有连接");
    
    if ([self.mutableBlockedPeers containsObject:peerID]) {
        invitationHandler(NO, nil);
        return;
    }
    
    NSLog(@"peerID.displayName = %@", peerID.displayName);
    
    [self.mutableBlockedPeers addObject:peerID];
    
       invitationHandler(YES, _session);
}

// Advertising did not start due to an error
- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didNotStartAdvertisingPeer:(NSError *)error {
    NSLog(@"无");
}


- (IBAction)sendData:(id)sender {
    NSLog(@"发图片");
    NSString *message = @"Hello, World!";
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    if (![_session sendData:data
                    toPeers:_mutableBlockedPeers
                   withMode:MCSessionSendDataReliable
                      error:&error]) {
        NSLog(@"[Error] %@", error);
    }

}

@end
