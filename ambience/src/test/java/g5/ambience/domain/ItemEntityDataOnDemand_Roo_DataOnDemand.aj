// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package g5.ambience.domain;

import g5.ambience.domain.ItemEntity;
import g5.ambience.domain.ItemEntityDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ItemEntityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ItemEntityDataOnDemand: @Component;
    
    private Random ItemEntityDataOnDemand.rnd = new SecureRandom();
    
    private List<ItemEntity> ItemEntityDataOnDemand.data;
    
    public ItemEntity ItemEntityDataOnDemand.getNewTransientItemEntity(int index) {
        ItemEntity obj = new ItemEntity();
        setDeveloper(obj, index);
        setDirector(obj, index);
        setEsrbRating(obj, index);
        setGenre(obj, index);
        setImageUrl(obj, index);
        setIsOut(obj, index);
        setMpaaRating(obj, index);
        setPlatform(obj, index);
        setReferenceNumber(obj, index);
        setReleaseYear(obj, index);
        setSynopsis(obj, index);
        setTitle(obj, index);
        setTrailerUrl(obj, index);
        setType(obj, index);
        setUserRating(obj, index);
        return obj;
    }
    
    public void ItemEntityDataOnDemand.setDeveloper(ItemEntity obj, int index) {
        String developer = "developer_" + index;
        if (developer.length() > 45) {
            developer = developer.substring(0, 45);
        }
        obj.setDeveloper(developer);
    }
    
    public void ItemEntityDataOnDemand.setDirector(ItemEntity obj, int index) {
        String director = "director_" + index;
        if (director.length() > 45) {
            director = director.substring(0, 45);
        }
        obj.setDirector(director);
    }
    
    public void ItemEntityDataOnDemand.setEsrbRating(ItemEntity obj, int index) {
        String esrbRating = "esrbRati_" + index;
        if (esrbRating.length() > 10) {
            esrbRating = esrbRating.substring(0, 10);
        }
        obj.setEsrbRating(esrbRating);
    }
    
    public void ItemEntityDataOnDemand.setGenre(ItemEntity obj, int index) {
        String genre = "genre_" + index;
        if (genre.length() > 45) {
            genre = genre.substring(0, 45);
        }
        obj.setGenre(genre);
    }
    
    public void ItemEntityDataOnDemand.setImageUrl(ItemEntity obj, int index) {
        String imageUrl = "imageUrl_" + index;
        if (imageUrl.length() > 200) {
            imageUrl = imageUrl.substring(0, 200);
        }
        obj.setImageUrl(imageUrl);
    }
    
    public void ItemEntityDataOnDemand.setIsOut(ItemEntity obj, int index) {
        Boolean isOut = true;
        obj.setIsOut(isOut);
    }
    
    public void ItemEntityDataOnDemand.setMpaaRating(ItemEntity obj, int index) {
        String mpaaRating = "mpa_" + index;
        if (mpaaRating.length() > 5) {
            mpaaRating = mpaaRating.substring(0, 5);
        }
        obj.setMpaaRating(mpaaRating);
    }
    
    public void ItemEntityDataOnDemand.setPlatform(ItemEntity obj, int index) {
        String platform = "platform_" + index;
        if (platform.length() > 45) {
            platform = platform.substring(0, 45);
        }
        obj.setPlatform(platform);
    }
    
    public void ItemEntityDataOnDemand.setReferenceNumber(ItemEntity obj, int index) {
        Integer referenceNumber = new Integer(index);
        obj.setReferenceNumber(referenceNumber);
    }
    
    public void ItemEntityDataOnDemand.setReleaseYear(ItemEntity obj, int index) {
        Date releaseYear = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setReleaseYear(releaseYear);
    }
    
    public void ItemEntityDataOnDemand.setSynopsis(ItemEntity obj, int index) {
        String synopsis = "synopsis_" + index;
        if (synopsis.length() > 500) {
            synopsis = synopsis.substring(0, 500);
        }
        obj.setSynopsis(synopsis);
    }
    
    public void ItemEntityDataOnDemand.setTitle(ItemEntity obj, int index) {
        String title = "title_" + index;
        if (title.length() > 45) {
            title = title.substring(0, 45);
        }
        obj.setTitle(title);
    }
    
    public void ItemEntityDataOnDemand.setTrailerUrl(ItemEntity obj, int index) {
        String trailerUrl = "trailerUrl_" + index;
        if (trailerUrl.length() > 200) {
            trailerUrl = trailerUrl.substring(0, 200);
        }
        obj.setTrailerUrl(trailerUrl);
    }
    
    public void ItemEntityDataOnDemand.setType(ItemEntity obj, int index) {
        String type = "type_" + index;
        if (type.length() > 45) {
            type = type.substring(0, 45);
        }
        obj.setType(type);
    }
    
    public void ItemEntityDataOnDemand.setUserRating(ItemEntity obj, int index) {
        Integer userRating = new Integer(index);
        obj.setUserRating(userRating);
    }
    
    public ItemEntity ItemEntityDataOnDemand.getSpecificItemEntity(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ItemEntity obj = data.get(index);
        Integer id = obj.getItemId();
        return ItemEntity.findItemEntity(id);
    }
    
    public ItemEntity ItemEntityDataOnDemand.getRandomItemEntity() {
        init();
        ItemEntity obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getItemId();
        return ItemEntity.findItemEntity(id);
    }
    
    public boolean ItemEntityDataOnDemand.modifyItemEntity(ItemEntity obj) {
        return false;
    }
    
    public void ItemEntityDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ItemEntity.findItemEntityEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ItemEntity' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ItemEntity>();
        for (int i = 0; i < 10; i++) {
            ItemEntity obj = getNewTransientItemEntity(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
