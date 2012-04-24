// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package g5.ambience.domain;

import g5.ambience.domain.UserEntity;
import g5.ambience.domain.UserEntityDataOnDemand;
import g5.ambience.domain.UserEntityIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserEntityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserEntityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserEntityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UserEntityIntegrationTest: @Transactional;
    
    @Autowired
    private UserEntityDataOnDemand UserEntityIntegrationTest.dod;
    
    @Test
    public void UserEntityIntegrationTest.testCountUserEntitys() {
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to initialize correctly", dod.getRandomUserEntity());
        long count = UserEntity.countUserEntitys();
        Assert.assertTrue("Counter for 'UserEntity' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserEntityIntegrationTest.testFindUserEntity() {
        UserEntity obj = dod.getRandomUserEntity();
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to initialize correctly", obj);
        String id = obj.getUsername();
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to provide an identifier", id);
        obj = UserEntity.findUserEntity(id);
        Assert.assertNotNull("Find method for 'UserEntity' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'UserEntity' returned the incorrect identifier", id, obj.getUsername());
    }
    
    @Test
    public void UserEntityIntegrationTest.testFindAllUserEntitys() {
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to initialize correctly", dod.getRandomUserEntity());
        long count = UserEntity.countUserEntitys();
        Assert.assertTrue("Too expensive to perform a find all test for 'UserEntity', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<UserEntity> result = UserEntity.findAllUserEntitys();
        Assert.assertNotNull("Find all method for 'UserEntity' illegally returned null", result);
        Assert.assertTrue("Find all method for 'UserEntity' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserEntityIntegrationTest.testFindUserEntityEntries() {
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to initialize correctly", dod.getRandomUserEntity());
        long count = UserEntity.countUserEntitys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<UserEntity> result = UserEntity.findUserEntityEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'UserEntity' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'UserEntity' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserEntityIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to initialize correctly", dod.getRandomUserEntity());
        UserEntity obj = dod.getNewTransientUserEntity(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'UserEntity' identifier to be null", obj.getUsername());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'UserEntity' identifier to no longer be null", obj.getUsername());
    }
    
    @Test
    public void UserEntityIntegrationTest.testRemove() {
        UserEntity obj = dod.getRandomUserEntity();
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to initialize correctly", obj);
        String id = obj.getUsername();
        Assert.assertNotNull("Data on demand for 'UserEntity' failed to provide an identifier", id);
        obj = UserEntity.findUserEntity(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'UserEntity' with identifier '" + id + "'", UserEntity.findUserEntity(id));
    }
    
}
