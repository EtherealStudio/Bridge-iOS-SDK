//
//  _SBBTaskReference.m
//
//	Copyright (c) 2014-2019 Sage Bionetworks
//	All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted provided that the following conditions are met:
//	    * Redistributions of source code must retain the above copyright
//	      notice, this list of conditions and the following disclaimer.
//	    * Redistributions in binary form must reproduce the above copyright
//	      notice, this list of conditions and the following disclaimer in the
//	      documentation and/or other materials provided with the distribution.
//	    * Neither the name of Sage Bionetworks nor the names of BridgeSDk's
//		  contributors may be used to endorse or promote products derived from
//		  this software without specific prior written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//	DISCLAIMED. IN NO EVENT SHALL SAGE BIONETWORKS BE LIABLE FOR ANY
//	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SBBTaskReference.m instead.
//

#import "_SBBTaskReference.h"
#import "ModelObjectInternal.h"
#import "NSDate+SBBAdditions.h"

#import "SBBSchemaReference.h"

@interface _SBBTaskReference()

@end

// see xcdoc://?url=developer.apple.com/library/etc/redirect/xcode/ios/602958/documentation/Cocoa/Conceptual/CoreData/Articles/cdAccessorMethods.html
@interface NSManagedObject (TaskReference)

@property (nullable, nonatomic, retain) NSString* activityDescription;

@property (nullable, nonatomic, retain) NSString* identifier;

@property (nullable, nonatomic, retain) NSNumber* minuteDuration;

@property (nullable, nonatomic, retain) NSManagedObject *activity;

@property (nullable, nonatomic, retain) NSManagedObject *schema;

@end

@implementation _SBBTaskReference

- (instancetype)init
{
	if ((self = [super init]))
	{

	}

	return self;
}

#pragma mark Scalar values

- (int64_t)minuteDurationValue
{
	return [self.minuteDuration longLongValue];
}

- (void)setMinuteDurationValue:(int64_t)value_
{
	self.minuteDuration = [NSNumber numberWithLongLong:value_];
}

#pragma mark Dictionary representation

- (void)updateWithDictionaryRepresentation:(NSDictionary *)dictionary objectManager:(id<SBBObjectManagerProtocol>)objectManager
{
    [super updateWithDictionaryRepresentation:dictionary objectManager:objectManager];

    self.activityDescription = [dictionary objectForKey:@"activityDescription"];

    self.identifier = [dictionary objectForKey:@"identifier"];

    self.minuteDuration = [dictionary objectForKey:@"minuteDuration"];

    NSDictionary *schemaDict = [dictionary objectForKey:@"schema"];

    if (schemaDict != nil)
    {
        SBBSchemaReference *schemaObj = [objectManager objectFromBridgeJSON:schemaDict];
        self.schema = schemaObj;
    }

}

- (NSDictionary *)dictionaryRepresentationFromObjectManager:(id<SBBObjectManagerProtocol>)objectManager
{
    NSMutableDictionary *dict = [[super dictionaryRepresentationFromObjectManager:objectManager] mutableCopy];

    [dict setObjectIfNotNil:self.activityDescription forKey:@"activityDescription"];

    [dict setObjectIfNotNil:self.identifier forKey:@"identifier"];

    [dict setObjectIfNotNil:self.minuteDuration forKey:@"minuteDuration"];

    [dict setObjectIfNotNil:[objectManager bridgeJSONFromObject:self.schema] forKey:@"schema"];

	return [dict copy];
}

- (void)awakeFromDictionaryRepresentationInit
{
	if (self.sourceDictionaryRepresentation == nil)
		return; // awakeFromDictionaryRepresentationInit has been already executed on this object.

	[self.schema awakeFromDictionaryRepresentationInit];

	[super awakeFromDictionaryRepresentationInit];
}

#pragma mark Core Data cache

+ (NSString *)entityName
{
    return @"TaskReference";
}

- (instancetype)initWithManagedObject:(NSManagedObject *)managedObject objectManager:(id<SBBObjectManagerProtocol>)objectManager cacheManager:(id<SBBCacheManagerProtocol>)cacheManager
{

    if (self = [super initWithManagedObject:managedObject objectManager:objectManager cacheManager:cacheManager]) {

        self.activityDescription = managedObject.activityDescription;

        self.identifier = managedObject.identifier;

        self.minuteDuration = managedObject.minuteDuration;

            NSManagedObject *schemaManagedObj = managedObject.schema;
        Class schemaClass = [SBBObjectManager bridgeClassFromType:schemaManagedObj.entity.name];
        SBBSchemaReference *schemaObj = [[schemaClass alloc] initWithManagedObject:schemaManagedObj objectManager:objectManager cacheManager:cacheManager];
        if (schemaObj != nil)
        {
          self.schema = schemaObj;
        }
    }

    return self;

}

- (NSManagedObject *)createInContext:(NSManagedObjectContext *)cacheContext withObjectManager:(id<SBBObjectManagerProtocol>)objectManager cacheManager:(id<SBBCacheManagerProtocol>)cacheManager
{
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"TaskReference" inManagedObjectContext:cacheContext];
    [self updateManagedObject:managedObject withObjectManager:objectManager cacheManager:cacheManager];

    // Calling code will handle saving these changes to cacheContext.

    return managedObject;
}

- (NSManagedObject *)saveToContext:(NSManagedObjectContext *)cacheContext withObjectManager:(id<SBBObjectManagerProtocol>)objectManager cacheManager:(id<SBBCacheManagerProtocol>)cacheManager
{
    NSManagedObject *managedObject = [cacheManager cachedObjectForBridgeObject:self inContext:cacheContext];
    if (managedObject) {
        [self updateManagedObject:managedObject withObjectManager:objectManager cacheManager:cacheManager];
    }

    // Calling code will handle saving these changes to cacheContext.

    return managedObject;
}

- (void)updateManagedObject:(NSManagedObject *)managedObject withObjectManager:(id<SBBObjectManagerProtocol>)objectManager cacheManager:(id<SBBCacheManagerProtocol>)cacheManager
{
    [super updateManagedObject:managedObject withObjectManager:objectManager cacheManager:cacheManager];
    NSManagedObjectContext *cacheContext = managedObject.managedObjectContext;

    managedObject.activityDescription = ((id)self.activityDescription == [NSNull null]) ? nil : self.activityDescription;

    if (self.identifier) managedObject.identifier = self.identifier;

    managedObject.minuteDuration = ((id)self.minuteDuration == [NSNull null]) ? nil : self.minuteDuration;

    // destination entity SchemaReference is not directly cacheable, so delete it and create the replacement
    if (managedObject.schema) {
        [cacheContext deleteObject:managedObject.schema];
    }
    NSManagedObject *relMoSchema = [self.schema createInContext:cacheContext withObjectManager:objectManager cacheManager:cacheManager];

    [managedObject setSchema:relMoSchema];

    // Calling code will handle saving these changes to cacheContext.
}

#pragma mark Direct access

- (void) setSchema: (SBBSchemaReference*) schema_ settingInverse: (BOOL) setInverse
{

    _schema = schema_;

}

- (void) setSchema: (SBBSchemaReference*) schema_
{
    [self setSchema: schema_ settingInverse: YES];
}

- (SBBSchemaReference*) schema
{
    return _schema;
}

@synthesize schema = _schema;

@end
